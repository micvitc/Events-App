from .db import db

class Event(db.Document):
    event_id = db.StringField(primary_key=True)
    event_name = db.StringField(required=True)
    event_date = db.DateTimeField(required=True)
    event_venue = db.StringField(required = True)
    event_host = db.StringField(required=True)
    event_coordinators = db.StringField()
    school_name = db.StringField(required=True)
