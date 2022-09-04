from flask import Flask
from flask_cors import CORS
from Events.api.events import events_api_v1
def create_app():
    app = Flask(__name__)
    CORS(app)
    app.register_blueprint(events_api_v1)
    return app 