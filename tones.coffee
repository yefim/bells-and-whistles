five = require('johnny-five')
board = new five.Board()
pwm = 3
alarmPin = 11

class Buzzer
  constructor: (@pin, @board) ->
    @board.pinMode(@pin, pwm) 
    @killSwitchTimeout = null
  
  buzz: (power, time) ->
    @board.analogWrite(@pin, power)
    @shutup(time)

  shutup: (time=0) ->
    clearTimeout(@killSwitchTimeout)
    @killSwitchTimeout = setTimeout =>
      @board.analogWrite(@pin, 0)
    , time

board.on "ready", ->
  p = new Buzzer(alarmPin, @)
  p.buzz(80, 2000)
