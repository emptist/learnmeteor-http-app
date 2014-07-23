Template.tslist.ts = ->
	Session.get "ts"

Template.tslist.latestRefresh = ->
	Session.get "latestRefresh"

	
Meteor.setInterval -> 
	Meteor.call "getTs",
		"javascript"
		(err, ts)->
			Session.set 'ts', ts
			d = new Date
			Session.set "latestRefresh" ,
				"#{d.getHours()} : #{d.getMinutes()} : #{d.getSeconds()}"
			
	3000 

