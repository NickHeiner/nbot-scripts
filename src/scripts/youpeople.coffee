# Description:
#   What do you mean YOU PEOPLE?
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
  robot.hear /you people/i, (msg) ->
    msg.send "What do you mean *you people*?"
