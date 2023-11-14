import mysql.connector, json
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def index():

    with open('/home/aria/school-database/dynamicTableConnect/secrets.json', 'r') as secretFile:
        creds = json.load(secretFile)['mysqlCredentials']

    connection = mysql.connector.connect(**creds)

    mycursor = connection.cursor()
    mycursor.execute("select * from Person")
    myresult = mycursor.fetchall()

    print("In the person table, we have the following items:")
    for row in myresult:
        print(row)

    mycursor.close()
    connection.close()

    return render_template("index.html", collection = myresult)

if __name__ == '__main__':
    app.run(debug=True)
