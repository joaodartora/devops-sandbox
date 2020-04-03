# Script to create an env_var by calling the http endpoint localhost:8080/conf/env/{env_var_name}/{env_var_value}

import os
from flask import Flask

app = Flask(__name__)

@app.route("/env/<name>/<var>")
def set_env_var(name, var):
    os.environ[name] = str(var)
    return os.environ.get(name)

if __name__=='__main__':
    app.run(debug=True, port=8080)
