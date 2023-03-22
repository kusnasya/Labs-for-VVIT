from flask import Flask, render_template, request, redirect
import psycopg2

app = Flask(__name__)
conn = psycopg2.connect(database="service_dddb",
                        user="postgres",
                        password="D8ck9A1s",
                        host="localhost",
                        port="5432")
cursor = conn.cursor()


@app.route('/login/', methods=['GET'])
def index():
    return render_template('login.html')


@app.route('/login/', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        if request.form.get("login"):
            username = request.form.get('username')
            password = request.form.get('password')
            if username == "":
                render_template('login.html', error_msg='Enter username')
                return render_template('login.html', error_msg='Enter username')
            if password == "":
                render_template('login.html', error_msg='Enter password')
                return render_template('login.html', error_msg='Enter password')
            cursor.execute("SELECT * FROM service.users WHERE login=%s AND "
                           "password=%s", (str(username), str(password)))
            records = list(cursor.fetchall())
            if len(records) == 0:
                return render_template('login.html', error_msg='Incorrect username or password, you must register')

            return render_template('account.html', full_name=records[0][1], login=username, password=password)
        elif request.form.get("registration"):
            return redirect("/registration/")

    return render_template('login.html')


@app.route('/registration/', methods=['POST', 'GET'])
def registration():
    if request.method == 'POST':
        name = request.form.get('name')
        login = request.form.get('login')
        password = request.form.get('password')
        if name == "":
            render_template('registration.html', error_msg='Enter name')
            return render_template('registration.html', error_msg='Enter name')
        if login == "":
            render_template('registration.html', error_msg='Enter login')
            return render_template('registration.html', error_msg='Enter login')
        if password == "":
            render_template('registration.html', error_msg='Enter password')
            return render_template('registration.html', error_msg='Enter password')
        true_password = list(password)
        true_login = list(login)
        if len(true_password) < 6:
            render_template('registration.html', error_msg='Your password must be at least 6 characters long')
            return render_template('registration.html',
                                   error_msg='Your password must be at least 6 characters long')
        if len(true_login) < 6:
            render_template('registration.html', error_msg='Your login must be at least 6 characters long')
            return render_template('registration.html', error_msg='Your login must be at least 6 characters long')
        try:
            cursor.execute("INSERT INTO service.users (full_name, login, password) VALUES"
                           "(%s, %s, %s);",
                           (str(name), str(login), str(password)))
            conn.commit()
        except psycopg2.errors.UniqueViolation:
            conn.commit()
            return render_template('registration.html', error_msg='There is already such a user')
        return redirect('/login/')
    return render_template('registration.html')
