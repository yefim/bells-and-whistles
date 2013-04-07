# app
five = require('johnny-five')
express = require('express')
app = express()
server = require('http').Server(app)
io = require('socket.io').listen(server)

Buzzer = require("./buzzer")
console.log Buzzer

board = new five.Board()

# app config
app.configure ->
  app.use(express.static("#{__dirname}/public"))
  app.set('env', process.env.NODE_ENV or 'development')
  app.set('port', process.env.PORT or 3000)

# sockets
board.on 'ready', ->
  p = new Buzzer(11, @)
  io.sockets.on 'connection', (socket) ->
    socket.on 'note', (data) ->
      p.buzz(80, 2000)

# listen
server.listen app.get('port'), ->
  console.log "Listening on #{app.get('port')}"
