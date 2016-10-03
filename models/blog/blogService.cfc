/**
* I am a new Model Object
*/
component accessors="false"{
	
    // Properties
    

    /**
     * Constructor
     */
	blogService function init(){
		
		return this;
	}

	function getpost (postid)
	{
		if(arguments.postid gt 0)
		{
			var myPost = entityLoadByPK("Post", arguments.postid);
		} else
		{
			var myPost = entityNew("Post"); 
		}
		return myPost;
	}

	function getposts ()
	{
		var myPost = entityLoad("Post");
		return myPost;
	}
	
	function deletepost(id)
	{
		p = getpost(id);
		entityDelete(p);
	}

	function save(data)
	{
		//writedump(data);abort;
		p = getpost(data.id);
		p.setContent(data.Content);
		p.setAuthor(data.Author);
		p.settitle(data.title);
		p.setCategory(data.Category);
		p.setdateposted(now());
		entitySave(p);
	}
	<!---
	function addpost(T, A, Co, Cat)
	{
		//writeDump(arguments);abort;

		var myQuery = queryExecute(
			'INSERT INTO blog(title, Author, Content, Category, dateposted, blogpostid) VALUES ("#arguments.T#", "#arguments.A#", "#arguments.Co#", "#arguments.Cat#", now(), 0) ');
	}

	function updatepost(BID, T, A, Co, Cat)
	{
		var myQuery = queryExecute(
			'update blog set title = "#arguments.T#", Author = "#arguments.A#", Content = "#arguments.Co#", Category = "#arguments.Cat#" where idblog = #arguments.BID#')
	}
	--->


	<!---- COMMENTS ----->

	function addcomment(data){
		
		//writeDump(data); abort;
		p = getpost(data.Postid);
		var c = entityNew('Comment');
		c.setComment(data.CC);
		c.setAuthor(data.CA);
		c.setdateposted(now());
		entitySave(c);
		//writeDump(c);
		p.addComment(c);
		entitySave(p);
		ORMFlush();
		//writedump(p);abort;
	}
}
