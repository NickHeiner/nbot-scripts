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
  robot.hear /pacific rim|toy story|finding nemo|hunger games|the hobbit|jump street/i, (msg) ->
    msg.send "Spoiler alert!"
