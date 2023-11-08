from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def form():
    return render_template("formPost.html")

@app.route('/submitformPost.html', methods=['POST'])
def renderTablePost():
    firstname = request.form.get('fname')
    lastname = request.form.get('lname')
    output = render_template('table.html', firstname=firstname, lastname=lastname)
    return output 

if __name__ == '__main__':
    app.run(debug=True)
