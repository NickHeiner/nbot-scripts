# Description:
#   Sometimes, unexpected things happen all of a sudden.
#
# Commands:
#   hubot suddenly|flip table - Sends this gif: http://i.minus.com/iKIedJ5P5Zugs.gif

module.exports = (robot) ->
  robot.hear /(suddenly|flip table)/ig, (msg) ->
            msg.send "http://i.minus.com/iKIedJ5P5Zugs.gif"

