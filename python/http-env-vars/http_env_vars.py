# Script to list local env_vars on http endpoint localhost:8080/conf/env

import os
from flask import Flask

app = Flask(__name__)

@app.route("/conf/env")
def list_env_vars():
    return str(os.environ)

if __name__=='__main__':
    app.run(debug=True, port=8080)
    
