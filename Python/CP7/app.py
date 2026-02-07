from flask import Flask, render_template
from models import Studio, Series, Game, db

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///games.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)


@app.route('/games')
def games():
    games_list = Game.query.all()
    return render_template('games.html', games=games_list)


if __name__ == '__main__':
    app.run(debug=True, port=5001)
