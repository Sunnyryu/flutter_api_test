from flask import Flask
from flask_restful import Api
 
app = Flask(__name__)
api = Api(app)
 
@app.route('/', methods=['GET'])
def hello_world() :
    return { 'result' : 'api finish!' }
 
if __name__ == '__main__' :
    app.run(port='3333',host='0.0.0.0')