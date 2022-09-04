from .db import db

class Event(db.Document):
    event_id = db.StringField(required=True, unique=True)
    event_name = db.StringField(required=True)
    event_date = db.DateTimeField(required=True)
    event_venue = db.StringField(required=True)
    