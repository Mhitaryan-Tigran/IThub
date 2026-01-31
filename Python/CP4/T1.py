from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    крылатое_выражение = "Лучше синица в руках, чем журавль в небе"
    return f"""
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Крылатое выражение</title>
    </head>
    <body>
        <div class="container">
            <h1>Крылатое выражение</h1>
            <p>"{крылатое_выражение}"</p>
        </div>
    </body>
    </html>
    """

if __name__ == '__main__':
    app.run(debug=True, port=5000)
