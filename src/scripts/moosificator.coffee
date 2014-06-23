# Description:
#   Because Moose are not just animals. 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot moose url - Moosificates your face. 
#
# Author:
#   alexandre.normand


module.exports = (robot) ->
  robot.respond /moose (.*)/i, (msg) ->
      msg.send "http://moosificator.herokuapp.com/?image=#{ msg.match[1] }"
