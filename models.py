import pymysql
from pymysql.cursors import DictCursor
from werkzeug.security import check_password_hash
import config


class Database:

    def __init__(self):
        self.db = None
        self.cursor = None

    def openDB(self):
        self.db = pymysql.connect(
            host=config.DB_HOST,
            user=config.DB_USER,
            password=config.DB_PASSWORD,
            database=config.DB_NAME,
            cursorclass=DictCursor
        )
        self.cursor = self.db.cursor()

    def closeDB(self):
        if self.cursor:
            self.cursor.close()
        if self.db:
            self.db.close()

    def select(self, sql, params=()):
        self.openDB()
        self.cursor.execute(sql, params)
        data = self.cursor.fetchall()
        self.closeDB()
        return data

    def selectOne(self, sql, params=()):
        self.openDB()
        self.cursor.execute(sql, params)
        data = self.cursor.fetchone()
        self.closeDB()
        return data

class User(Database):
    def login(self, username, password):
        u = self.selectOne("SELECT * FROM user WHERE username = %s", (username,))
        if u is None:
            return None
        if u["password"].startswith(("scrypt:", "pbkdf2:")):
            cocok = check_password_hash(u["password"], password)
        else:
            cocok = u["password"] == password
        return u if cocok else None

    def selectDB(self):
        return self.select("SELECT id_user, nama, username, role FROM user ORDER BY id_user")


class Destinasi(Database):
    def selectDB(self, q=""):
        if q:
            return self.select("SELECT * FROM destinasi WHERE tujuan LIKE %s "
                               "OR deskripsi LIKE %s ORDER BY id_destinasi",
                               (f"%{q}%", f"%{q}%"))
        return self.select("SELECT * FROM destinasi ORDER BY id_destinasi")

    def getDB(self, id_destinasi):
        return self.selectOne("SELECT * FROM destinasi WHERE id_destinasi = %s",
                              (id_destinasi,))

class Supir(Database):
    def selectDB(self):
        return self.select("SELECT * FROM supir ORDER BY id_supir")

class Kendaraan(Database):
    def selectDB(self):
        return self.select("SELECT * FROM kendaraan ORDER BY id_kendaraan")


class Jadwal(Database):
    SQL = ("SELECT j.id_jadwal, j.tanggal_berangkat, d.tujuan, s.nama_supir, "
           "k.jenis_kendaraan, k.plat_nomor, k.kapasitas, "
           "(SELECT COALESCE(SUM(t.jumlah), 0) FROM transaksi t "
           " WHERE t.id_jadwal = j.id_jadwal) AS terisi "
           "FROM jadwal j "
           "LEFT JOIN destinasi d ON d.id_destinasi = j.id_destinasi "
           "LEFT JOIN supir s ON s.id_supir = j.id_supir "
           "LEFT JOIN kendaraan k ON k.id_kendaraan = j.id_kendaraan ")

    def selectDB(self, dari_tanggal=None):
        if dari_tanggal:
            baris = self.select(self.SQL + "WHERE j.tanggal_berangkat >= %s "
                                "ORDER BY j.tanggal_berangkat, j.id_jadwal", (dari_tanggal,))
        else:
            baris = self.select(self.SQL + "ORDER BY j.tanggal_berangkat, j.id_jadwal")
        for b in baris:
            b["sisa"] = max(int(b["kapasitas"] or 0) - int(b["terisi"]), 0)
        return baris

    def getDB(self, id_jadwal):
        j = self.selectOne(self.SQL + "WHERE j.id_jadwal = %s", (id_jadwal,))
        if j:
            j["sisa"] = max(int(j["kapasitas"] or 0) - int(j["terisi"]), 0)
        return j
        
    def selectByDestinasi(self, id_destinasi):
        baris = self.select(self.SQL + "WHERE d.id_destinasi = %s "
                            "ORDER BY j.tanggal_berangkat, j.id_jadwal",
                            (id_destinasi,))
        for b in baris:
            b["sisa"] = max(int(b["kapasitas"] or 0) - int(b["terisi"]), 0)
        return baris


class Transaksi(Database):
    def selectDB(self, id_user=None):
        sql = ("SELECT t.id_transaksi, u.nama AS pemesan, d.tujuan, "
               "j.tanggal_berangkat, t.tanggal_bayar, t.jumlah, t.harga, t.status_bayar "
               "FROM transaksi t "
               "LEFT JOIN user u ON u.id_user = t.id_user "
               "LEFT JOIN jadwal j ON j.id_jadwal = t.id_jadwal "
               "LEFT JOIN destinasi d ON d.id_destinasi = j.id_destinasi ")
        if id_user is None:
            return self.select(sql + "ORDER BY t.id_transaksi")
        return self.select(sql + "WHERE t.id_user = %s ORDER BY t.id_transaksi", (id_user,))
