from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify(
        message="Hello from CI/CD pipeline!",
        status="ok"
    )


@app.route("/health")
def health():
    return jsonify(status="healthy")


if __name__ == "__main__":
    # Dev server (don't use in real prod, we use gunicorn in Docker)
    app.run(host="0.0.0.0", port=5000, debug=True)
