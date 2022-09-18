from .event import EventsApi, EventApi, FilterApi

def initialize_routes(api):
    api.add_resource(EventsApi, '/api/events')
    api.add_resource(EventApi, '/api/events/<id>')
    api.add_resource(FilterApi, '/api/events/filter/<school_name>')