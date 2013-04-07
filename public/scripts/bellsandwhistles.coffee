socket = io.connect('http://localhost')
socket.emit 'note', {note: 'hello'}
