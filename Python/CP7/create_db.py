from flask import Flask
from models import Studio, Series, Game, db

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///games.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)


if __name__ == '__main__':
    with app.app_context():
        db.create_all()

        studio1 = Studio(name='Rockstar Games')
        studio2 = Studio(name='CD Projekt Red')
        studio3 = Studio(name='FromSoftware')
        studio4 = Studio(name='Naughty Dog')
        db.session.add_all([studio1, studio2, studio3, studio4])
        db.session.commit()

        series1 = Series(title='Grand Theft Auto', studio=studio1)
        series2 = Series(title='Red Dead', studio=studio1)
        series3 = Series(title='The Witcher', studio=studio2)
        series4 = Series(title='Cyberpunk', studio=studio2)
        series5 = Series(title='Dark Souls', studio=studio3)
        series6 = Series(title='The Last of Us', studio=studio4)

        game1 = Game(title='GTA V', year='2013', genre='Action', rating='9.7', series=series1)
        game2 = Game(title='GTA IV', year='2008', genre='Action', rating='9.5', series=series1)
        game3 = Game(title='Red Dead Redemption 2', year='2018', genre='Adventure', rating='9.8', series=series2)
        game4 = Game(title='The Witcher 3', year='2015', genre='RPG', rating='9.8', series=series3)
        game5 = Game(title='Cyberpunk 2077', year='2020', genre='RPG', rating='9.0', series=series4)
        game6 = Game(title='Dark Souls III', year='2016', genre='Action RPG', rating='9.1', series=series5)
        game7 = Game(title='The Last of Us Part II', year='2020', genre='Adventure', rating='9.3', series=series6)
        game8 = Game(title='The Last of Us Part I', year='2022', genre='Adventure', rating='9.5', series=series6)

        db.session.add_all([series1, series2, series3, series4, series5, series6,
                            game1, game2, game3, game4, game5, game6, game7, game8])
        db.session.commit()
