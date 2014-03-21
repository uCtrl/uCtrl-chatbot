# Description:
#   Simple script to blame yourself
# Dependencies:
#   None
# Commands:
#   @Admin blame me
# Author:
#   jpg

module.exports = (robot) ->

  robot.respond /blame me/i, (msg) ->    
     msg.send "#{msg.message.user.name} prend le blâme. C'est de sa faute."