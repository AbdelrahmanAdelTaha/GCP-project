from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Flask Hello World!!'


@app.route('/abdoadel')
def test():
    return 'Hello From Abdelrahman Adel'


if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=5000)
