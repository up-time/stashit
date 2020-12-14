from flask import Flask,render_template
import socket
import string
import uuid
from datetime import datetime
TIMERS = {}
STASH = {}

app = Flask(__name__)

@app.route('/startNamedTimer/<name>')
def start_timer_by_name(name):
    now = datetime.now()
    thisTime = now.strftime("%d/%m/%Y %H:%M:%S")
    TIMERS[name] = thisTime
    return '{}'.format(name)

@app.route('/start')
def start_timer():
    timerID = str(uuid.uuid1()) 
    now = datetime.now()
    thisTime = now.strftime("%d/%m/%Y %H:%M:%S")
    TIMERS[timerID] = thisTime
    return '{}'.format(timerID)

@app.route('/end/<timerID>')
def end(timerID):
    start = TIMERS[timerID]
    begin = datetime.strptime(start, '%d/%m/%Y %H:%M:%S') 
    thisDate   = datetime.now()
    thisTime = thisDate.strftime("%d/%m/%Y %H:%M:%S")
    now  = datetime.strptime(thisTime, '%d/%m/%Y %H:%M:%S')
    duration = now - begin 
    seconds = duration.total_seconds()
    return '{}'.format(seconds)

@app.route('/allTimers')
def allTimers():
    return '{}'.format(TIMERS)


@app.route('/stash/<item>')
def stash(item):
    id = str(uuid.uuid1())
    STASH[id] = item
    return '{}'.format(id)

@app.route('/unstash/<itemID>')
def unstash(itemID):
    return '{}'.format(STASH[itemID])

@app.route('/split/<splitter>/<item>')
def split(splitter, item):
    splitItems = item.split(splitter)
    return '{}'.format(splitItems)

@app.route('/healthcheck')
def healthcheck():
    return 'healthy'


@app.route("/")
def index():
    try:
        host_name = socket.gethostname()
        host_ip = socket.gethostbyname(host_name)
        return render_template('index.html', hostname=host_name, ip=host_ip)
    except:
        return render_template('error.html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
