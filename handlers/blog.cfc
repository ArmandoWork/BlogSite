/**
* I am a new handler for the bLog
*/
component{
	

	function preHandler( event, rc, prc, action, eventArguments ){
		variables.blogService = getModel('blog/blogService');
	}
		
    function index( event, rc, prc ){
    	prc.posts = variables.blogService.getposts();
		event.setView( "blog/list" );
	}

	function edit( event, rc, prc){
		prc.post = variables.blogService.getpost(event.getvalue('id', 0));
		event.setView("blog/edit");
	}

	function view( event, rc, prc){
		prc.post = variables.blogService.getpost(rc.id);
		event.setView("blog/view");
	}

	function addComment(event, rc, prc){
		variables.blogService.addComment(rc);
		setNextEvent(event="blog.view", queryString="id=#val(rc.postid)#");
	}

	function removeComment(event, rc, prc){
		variables.blogService.removeComment(rc.commentid);
		setNextEvent(event="blog.view", queryString="id=#val(rc.postid)#");
	}

	function delete( event, rc, prc ){
    	variables.blogService.deletepost(rc.id);
    	setNextEvent(event="blog.index", queryString="msg=post gelöscht");
	}

	function save( event, rc, prc){ 
		variables.blogService.save(rc);
		if(val(rc.id))
		{
			setNextEvent(event="blog.index", queryString="msg=post bearbeitet");
		}
		else
		{
			setNextEvent(event="blog.index", queryString="msg=post hinzugefügt");
			
		}
	}
}
