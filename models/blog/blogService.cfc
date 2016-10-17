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
		p.setAuthor(getAuthor(data.Author));
		p.settitle(data.title);
		p.setCategory(data.Category);
		p.setdateposted(now());
		entitySave(p);
	}
	
	<!---- COMMENTS ----->

	function addcomment(data){
		
		//writeDump(data); abort;
		p = getpost(val(data.Postid));
		var c = entityNew('Comment');
		c.setComment(data.CC);
		c.setUser(data.CU);
		c.setdateposted(now());
		entitySave(c);
		//writeDump(c);
		p.addComment(c);
		entitySave(p);
		ORMFlush();
		//writedump(p);abort;
	}

	function removecomment(commentid){
		var c = entityLoadByPK('Comment',arguments.commentID);
		if(!isNull(c)){
			entityDelete(c);
			ORMFlush();
		}
	}

	<!--- Authors --->

	function getAuthors(){
		var myAuthor = entityLoad("Author");
		return myAuthor;
	}

	function getAuthor(id){
		var a = entityLoadByPK("Author",arguments.id);
		return a;
	}
}
