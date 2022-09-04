from flask import Response, request, Blueprint
from database.model import Event
from flask_restful import Resource


class EventsApi(Resource):
    def get(self):
        events = Event.objects().to_json()
        return Response(events,mimetype="application/json", status=200)
    
    def post(self):
        body = request.get_json()
        event = Event(**body).save()
        id = event.id
        return {'id':str(id)}, 200

class EventApi(Resource):
    def get(self, id):
        event = Event.objects.get(id=id).to_json()
        return Response(event, mimetype="application/json", status=200)
    def put(self, id):
        body = request.get_json()
        Event.objects.get(id=id).update(**body)
        return '', 200
    def delete(self, id):
        Event.objects.get(id=id).delete(**body)
        return '', 200

event_blueprint = Blueprint("events", __name__ )

    