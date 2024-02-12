from flask import Flask, render_template, request, redirect
import psycopg2

def db_connection():
    return psycopg2.connect(database="pyweb",
                            host="localhost",
                            port="5432",
                            user="depermana",
                            password ="gundam123"
                            )

app = Flask(__name__)

SPORTS = ["Basketball", "Soccer", "Ultimate Frisbee"]

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/form")
def form():
    return render_template("form.html", sports=SPORTS)

@app.route("/register", methods=["POST"])
def register():

    # server side validation
    # validate name
    name = request.form.get("name")
    sport = request.form.get("sport")
    # validate sport
    if not name or sport not in SPORTS:
        return render_template("error.html", message="Missing name")
    
    conn = db_connection()
    cur = conn.cursor()

    cur.execute("INSERT INTO registrants(name, sport) VALUES(%s, %s)", (name, sport))
    conn.commit()

    cur.close()
    conn.close()
    
    return redirect("/registrants")


@app.route("/registrants")
def registrants():
    conn = db_connection()
    cur = conn.cursor()

    cur.execute("SELECT * FROM registrants;")
    registrans_data = cur.fetchall()

    cur.close()
    conn.close()
    return render_template("registrants.html", registrants=registrans_data)


@app.route("/deregister", methods=["POST"])
def deregister():
    conn = db_connection()
    cur = conn.cursor()

    id =  request.form.get("id")
    if id:
        cur.execute("DELETE FROM registrants WHERE id = (%s)", (id,))
        conn.commit()

        cur.close()
        conn.close()
    return redirect("/registrants")