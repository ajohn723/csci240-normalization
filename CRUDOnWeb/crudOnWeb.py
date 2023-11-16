#!/usr/bin/python3

from flask import Flask, render_template, request, redirect, url_for
import mysql.connector, json


app = Flask(__name__)


@app.route('/', methods=['GET'])
def showPerson():
    with open('/home/aria/school-database/CRUDOnWeb/secrets.json', 'r') as secretFile:
        creds = json.load(secretFile)['mysqlCredentials']

    connection = mysql.connector.connect(**creds)
    mycursor = connection.cursor()

    # GET variables: ID, fname, lname, insert the new value into the database
    newPersonID = request.args.get('PersonID')
    newFirstName = request.args.get('FirstName')
    newLastName = request.args.get('LastName')

    if newPersonID is not None and newFirstName is not None and newLastName is not None:
        mycursor.execute("INSERT into Person (PersonID, FirstName, LastName) values (%s, %s, %s)", (newPersonID, newFirstName, newLastName))
        connection.commit()
    elif request.args.get('delete') == 'true':
        print("delete statement executed")
        deleteID = request.args.get('PersonID')
        mycursor.execute("DELETE from Person where PersonID=%s", (deleteID,))
        connection.commit()

    # Fetch the current values of the Person table
    mycursor.execute("Select * from Person")
    myresult = mycursor.fetchall()
    mycursor.close()
    connection.close()
    return render_template('personList.html', collection=myresult)

@app.route("/updatePerson")
def updatePerson():
    with open('/home/aria/school-database/CRUDOnWeb/secrets.json', 'r') as secretFile:
        creds = json.load(secretFile)['mysqlCredentials']

    connection = mysql.connector.connect(**creds)
    mycursor = connection.cursor()

    PersonID = request.args.get('PersonID')
    newFirstName = request.args.get('FirstName')
    newLastName = request.args.get('LastName')

    if PersonID is None:
        return "Error, id not specified"
    elif PersonID is not None and newFirstName is not None and newLastName is not None:
        mycursor = connection.cursor()
        mycursor.execute("UPDATE Person set FirstName=%s, LastName=%s where PersonID=%s", (newFirstName, newLastName, PersonID))
        mycursor.close()
        connection.commit()
        connection.close()
        return redirect(url_for('showPerson'))

    mycursor = connection.cursor()
    mycursor.execute("select * from Person where PersonID=%s;", (PersonID,))
    _, existingFirstName, existingLastName = mycursor.fetchone()
    mycursor.close()
    connection.close()
    return render_template('personUpdate.html', PersonID=PersonID, existingFirstName=existingFirstName, existingLastName=existingLastName)
    # return "hello world"

if __name__ == '__main__':
    app.run(port=8000, debug=True, host="0.0.0.0")