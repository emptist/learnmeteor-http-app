Meteor.methods	
	getTs: (searchTerm)-> 
		response = Meteor.http.get 'http://search.twitter.com/search.json', #"http://hq.sinajs.cn/list=" 
			params:
				#list: searchTerm 
				q: searchTerm 

		response.data.results.map (tt)-> 
			return {
				user: tt.from_user_name
				text: tt.text["length"]}

