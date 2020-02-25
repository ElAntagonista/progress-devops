from flask import Flask
import os


name = os.getenv("NAME")
app = Flask(__name__)
@app.route("/")
def hello():
    return f"Hello {name}!"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
