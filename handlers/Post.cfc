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
		variables.commentService = getModel('comment/commentService');
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

    	//writeDump(prc.posts);abort;
		event.setView( "Post/list" );
	}

	function edit( event, rc, prc){
		prc.post = variables.blogService.getpost(event.getvalue('id', 0));

		event.setView("Post/edit");
	}

	function view( event, rc, prc){
		prc.post = variables.blogService.getpost(rc.id);
		prc.comment = variables.commentService.getcomments(rc.id);
		
		event.setView("Post/view");
	}

	function delete( event, rc, prc ){

    	variables.blogService.deletepost(rc.id);

    	setNextEvent(event="post.index", queryString="msg=post gelöscht");
	}

	function save( event, rc, prc){ 
		//writeDump(rc);abort;
		variables.blogService.save(rc);

		if(val(rc.id))
		{
			setNextEvent(event="post.index", queryString="msg=post bearbeitet");
		}
		else
		{
			setNextEvent(event="post.index", queryString="msg=post hinzugefügt");
			
		}
	}

	function editC( event, rc, prc){;
		prc.comment = variables.commentService.getcomment(rc.cid);
		
		event.setView("Post/editC");
	}

	function saveC(event, rc, prc){
		<!---if(rc.cid)
		{
			variables.commentService.updatecomment(rc.cid, rc.cA, rc.CC);
			setNextEvent(event="post.view&id=#rc.id#", queryString="msg=Comment bearbeitet");
		}
		else
		{ --->

			variables.blogService.addcomment(rc);
			setNextEvent(event="post.view&id=#rc.Postid#", queryString="msg=Comment hinzugefügt");
			
		<!---}--->
	}

	function deleteC( event, rc, prc ){
		//writeDump(rc); abort;
    	variables.commentService.deletecomment(rc.id);

    	setNextEvent(event="post.view&id=#rc.id2#", queryString="msg=Comment gelöscht");
	}

}
