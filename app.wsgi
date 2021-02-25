#! /usr/bin/python3.6

import logging
import sys
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, '/srv/')
from app import app as application
app.secret_key = os.getenv('SUDOKUFLASK_SECRET_KEY')