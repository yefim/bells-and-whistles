module.exports =
  class Buzzer
    constructor: (@pin, @board) ->
      @board.pinMode(@pin, 3)
      @killSwitchTimeout = null
    
    buzz: (power, time) ->
      @board.analogWrite(@pin, power)
      @shutup(time)

    shutup: (time=0) ->
      clearTimeout(@killSwitchTimeout)
      @killSwitchTimeout = setTimeout =>
        @board.analogWrite(@pin, 0)
      , time
