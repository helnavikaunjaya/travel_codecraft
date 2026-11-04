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

   
