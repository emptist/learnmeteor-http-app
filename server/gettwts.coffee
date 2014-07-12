Meteor.methods	
	getTs: (searchTerm)-> 
		response = Meteor.http.call "GET" ,
			'http://search.twitter.com/search.json', #"http://hq.sinajs.cn/list=" 
			params:
				#list: searchTerm 
				q: searchTerm 

		response.data.results.map (tt)->
			user: tt.from_user_name
			text:tt.text

###			
		(for  t in response.data.results
			(t)->	user: t.from_user_name, text:t.text)
###