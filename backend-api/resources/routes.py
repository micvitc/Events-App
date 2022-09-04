from .event import EventsApi, EventApi

def initialize_routes(api):
    api.add_resource(EventsApi, '/api/events')
    api.add_resource(EventApi, '/api/events/<id>')