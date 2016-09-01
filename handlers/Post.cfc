/**
* I am a new handler
*/
component{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";		
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	function preHandler( event, rc, prc, action, eventArguments ){
		variables.blogService = getModel('blog/blogService');
	}
	
	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/
		
	/**
    * index  
    */
    function index( event, rc, prc ){
    	prc.posts = variables.blogService.getposts();
    	
    	//writeDump(posts);abort;
		event.setView( "Post/list" );
	}

	function edit( event, rc, prc){
		prc.post = variables.blogService.getpost(event.getvalue('id', 0));

		event.setView("Post/edit");
	}

	function view( event, rc, prc){
		prc.post = variables.blogService.getpost(rc.id);
		
		event.setView("Post/view");
	}

	function delete( event, rc, prc ){

    	variables.blogService.deletepost(rc.id);

    	setNextEvent(event="post.index", queryString="msg=post deleted");
	}

	function save( event, rc, prc){ 
		//writeDump(rc);abort;
		if(rc.id)
		{
			variables.blogService.updatepost(rc.id, rc.title, rc.Author, rc.Content, rc.Category);
			setNextEvent(event="post.index", queryString="msg=post bearbeitet");
		}
		else
		{
			variables.blogService.addpost(rc.title, rc.Author, rc.Content, rc.Category);
			setNextEvent(event="post.index", queryString="msg=post hinzugefügt");
			
		}
	}

}
