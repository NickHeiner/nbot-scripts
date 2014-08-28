# Description:
#   SPOILER ALERT!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   ben.packer

module.exports = (robot) ->
  robot.hear /movie|film|pacific rim|toy story/i, (msg) ->
    msg.send "SPOILER ALERT!"
