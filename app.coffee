# app
express = require('express')
app = express()
server = require('http').Server(app)
io = require('socket.io')(server)

# app config
app.configure ->
  app.use(express.static("#{__dirname}/public"))
  app.set('env', process.env.NODE_ENV or 'development')
  app.set('port', process.env.PORT or 3000)

# sockets
io.sockets.on 'connection', (socket) ->
  socket.on 'note', (data) ->
    # play note
    console.log data

# listen
server.listen app.get('port'), ->
  console.log "Listening on #{app.get('port')}"
