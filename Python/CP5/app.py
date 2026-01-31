from flask import Flask, render_template
import datetime

app = Flask(__name__)

@app.route('/')
def index():
    now = datetime.datetime.now()
    hour = now.hour
    
    if 6 <= hour < 12:
        greeting = "Доброе утро"
    elif 12 <= hour < 18:
        greeting = "Добрый день"
    elif 18 <= hour < 24:
        greeting = "Добрый вечер"
    else:  # 0 <= hour < 6
        greeting = "Доброй ночи"
    
    return render_template('index.html', greeting=greeting)

if __name__ == '__main__':
    app.run(debug=True, port=5000)
