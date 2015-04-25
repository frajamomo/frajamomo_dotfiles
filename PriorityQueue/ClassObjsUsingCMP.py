try:
    import Queue as Q  # ver. < 3.0
except ImportError:
    import queue as Q

class ClientVersion(object):
    def __init__(self, name, version, timestamp):
        self.name = name
        self.version = version
        self.timestamp = timestamp
        return
    def __cmp__(self, other):
        return cmp(self.timestamp, other.timestamp)

q = Q.PriorityQueue()

q.put(ClientVersion('twitter', 'web_browser', 20150426000005))
q.put(ClientVersion('twitter', 'web_browser', 20150426000001))
q.put(ClientVersion('twitter', 'web_browser', 20150426000002))
q.put(ClientVersion('twitter', 'web_browser', 20150426000003))
q.put(ClientVersion('twitter', 'web_browser', 20150426000004))

while not q.empty():
    next_element = q.get()
    print 'Processing ClientVersion:', next_element.timestamp
