#! /usr/bin/python3

from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("form-get.html")

@app.route('/submitformGet.html', methods=['GET'])
def renderTableGet():
    personID = request.args.get('personID')
    firstname = request.args.get('fname')
    lastname = request.args.get('lname')
    output = render_template('table.html', personID=personID, firstname=firstname, lastname=lastname)
    return output 

if __name__ == '__main__':
    app.run(port=8000, debug=True, host="0.0.0.0")