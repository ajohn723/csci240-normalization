from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello, world! :) '

@app.route()
def renderMultiple():
    studentTable = {}

if __name__ == '__main__':
    app.run(port=8000, debug=True, host="0.0.0.0")

    #in command line: chmod +x hello-server.py
    # ./ = full path, to run the file
    # ./hello-server.py