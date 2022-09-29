from .db import db

class Event(db.Document):
    event_id = db.StringField(primary_key=False)
    event_name = db.StringField(required=True)
    event_date = db.DateTimeField(required=True)
    event_venue = db.StringField(required = True)
    event_host = db.StringField(required=True)
    event_coordinators = db.StringField()
    reg_url = db.URLField(required=True,blank=True,null=True)
    school_name = db.StringField(required=True)
