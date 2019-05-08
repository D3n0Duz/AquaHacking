from flask import Flask


DBUSER = 'marco'
DBPASS = 'foobarbaz'
DBHOST = 'db'
DBPORT = '5432'
DBNAME = 'testdb


sql = "CREATE DATABASE aquahack"

app = Flask(__name__)

@app.route("/")
def hello():
    return "Your application runs with Docker!!"

if __name__ == "__main__":
app.run(debug=True,host='0.0.0.0')