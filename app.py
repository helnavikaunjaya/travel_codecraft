from datetime import date
from functools import wraps
from flask import (Flask, render_template, request, redirect, url_for,
                   session, abort)
from models import User, Destinasi, Supir, Kendaraan, Jadwal, Transaksi
import config

app = Flask(__name__)
app.config["SECRET_KEY"] = config.SECRET_KEY

@app.template_filter("rupiah")
def rupiah(angka):
    return "Rp {:,}".format(int(angka)).replace(",", ".")


@app.context_processor
def kirim_user():
    return {"user": session.get("user")}


def login_required(f):
    @wraps(f)
    def cek(*args, **kwargs):
        if "user" not in session:
            return redirect(url_for("login"))
        return f(*args, **kwargs)
    return cek


def admin_required(f):
    @wraps(f)
    def cek(*args, **kwargs):
        if "user" not in session:
            return redirect(url_for("login"))
        if session["user"]["role"] != "admin":
            return redirect(url_for("destinasi"))
        return f(*args, **kwargs)
    return cek

@app.route("/tentang")
def tentang():
    return render_template("tentang.html", judul="Tentang")


@app.route("/login", methods=["GET", "POST"])
def login():
    error = None
    if request.method == "POST":
        u = User().login(request.form["username"].strip(), request.form["password"])
        if u:
            session.clear()
            session["user"] = {"id": u["id_user"], "nama": u["nama"], "role": u["role"]}
            return redirect(url_for("destinasi"))
        error = "Username atau password salah."
    return render_template("login.html", judul="Login", error=error)


@app.route("/logout", methods=["POST"])
def logout():
    session.clear()
    return redirect(url_for("destinasi"))

@app.route("/")
def beranda():
    unggulan = Destinasi().selectDB()[:3]   
    return render_template("beranda.html", judul="Beranda", unggulan=unggulan)


@app.route("/destinasi")
def destinasi():
    q = request.args.get("q", "").strip()
    daftar = Destinasi().selectDB(q)
    if q and not daftar:       
        abort(404)
    return render_template("destinasi.html", judul="Daftar Destinasi", daftar=daftar, q=q)
  
@app.route("/supir")
@admin_required
def daftar_supir():
    return render_template("supir.html", judul="Daftar Supir", baris=Supir().selectDB())

@app.route("/user")
@admin_required
def daftar_user():
    return render_template("user.html", judul="Daftar User", users=User().selectDB())
  
@app.route("/kendaraan")
@admin_required
def daftar_kendaraan():
    return render_template("kendaraan.html", judul="Daftar Kendaraan",
                           baris=Kendaraan().selectDB())

@app.route("/jadwal")
@login_required
def jadwal():
    if session["user"]["role"] == "admin":
        baris = Jadwal().selectDB()
    else:
        baris = Jadwal().selectDB(date.today().isoformat())
    return render_template("jadwal.html", judul="Jadwal Perjalanan", baris=baris)

@app.route("/transaksi")
@login_required
def transaksi():
    admin = session["user"]["role"] == "admin"
    if admin:
        baris = Transaksi().selectDB()
    else:
        baris = Transaksi().selectDB(session["user"]["id"])
    return render_template("transaksi.html",
                           judul="Daftar Transaksi" if admin else "Transaksi Saya",
                           baris=baris, admin=admin)

@app.errorhandler(404)
def tidak_ditemukan(e):
    return render_template("404.html", judul="404"), 404


if __name__ == "__main__":
    app.run(debug=True, port=5001)
