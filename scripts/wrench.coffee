# Description:
#   Simple script to wrench people OUT. We take into account that the folder contains only pictures.
# Dependencies:
#   None
# Configuration:
#   HUBOT_DROPBOX_TOKEN: Should containt OAuth2 access Token
# Commands:
#   @Admin wrench me
# Author:
#   jpg

module.exports = (robot) ->

  robot.respond /wrench me/i, (msg) ->
    
    token = process.env.HUBOT_DROPBOX_TOKEN
    unless token
      msg.send "Please set the HUBOT_DROPBOX_TOKEN environment variable."
      return

    msg.http("https://api.dropbox.com/1/metadata/dropbox/Public/bijous").header("Authorization", "Bearer " + process.env.HUBOT_DROPBOX_TOKEN)
      .get() (err, res, body) ->
        bijoux = (bijou.path for bijou in JSON.parse(body).contents when !bijou.is_dir)
        msg.send "https://dl.dropboxusercontent.com/u/20555619" + bijoux[Math.floor (Math.random() * bijoux.length)].replace /public\//, ""