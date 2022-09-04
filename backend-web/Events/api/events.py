

from flask import Blueprint, request, jsonify
# from Events.db import db-functions

from flask_cors import CORS
from datetime import datetime

events_api_v1 = Blueprint('events_api_v1', 'events_api_v1', url_prefix='/api/v1/events')

CORS(events_api_v1)

"""
 Define routes in this area.
"""