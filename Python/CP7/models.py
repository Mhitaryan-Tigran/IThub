from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Studio(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)


class Series(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    studio_id = db.Column(db.Integer, db.ForeignKey('studio.id'), nullable=False)
    studio = db.relationship('Studio', backref=db.backref('series_list', lazy=True))


class Game(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    year = db.Column(db.String(4), nullable=False)
    genre = db.Column(db.String(50), nullable=False)
    rating = db.Column(db.String(5), nullable=False)
    series_id = db.Column(db.Integer, db.ForeignKey('series.id'), nullable=False)
    series = db.relationship('Series', backref=db.backref('games', lazy=True))
