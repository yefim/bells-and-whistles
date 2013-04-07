socket = io.connect('http://localhost')
# create id
id = Math.floor(Math.random() * 10)

document.addEventListener 'click', ->
  console.log id
  socket.emit 'note', {id: id}
