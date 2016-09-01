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
		var myQuery = queryExecute(
			"SELECT * from blog
			where idblog = #arguments.postid#" 
			 
			);
		} else
		{
			var myQuery = queryNew("idblog, title, Author, Content, Category, dateposted, blogpostid")
			queryAddRow(myQuery, 1);
			querySetCell(myQuery, "idblog", 0);
			querySetCell(myQuery, "title", "");
			querySetCell(myQuery, "Author", "");
			querySetCell(myQuery, "Content", "");
			querySetCell(myQuery, "Category", "");
			querySetCell(myQuery, "dateposted", "");
			querySetCell(myQuery, "blogpostid", 0); 
		}
		return myquery;

	}

	function getposts ()
	{
		var myQuery = queryExecute(
			"SELECT * from blog" 
			 
			);
		return myquery;
	}
	
	function addpost(T, A, Co, Cat)
	{
		//writeDump(arguments);abort;

		var myQuery = queryExecute(
			'INSERT INTO blog(title, Author, Content, Category, dateposted, blogpostid) VALUES ("#arguments.T#", "#arguments.A#", "#arguments.Co#", "#arguments.Cat#", now(), 0) ');
	}

	function deletepost(BID)
	{
		var myQuery = queryExecute('DELETE FROM blog WHERE idblog="#arguments.BID#"');
	}

	function updatepost(BID, T, A, Co, Cat)
	{
		var myQuery = queryExecute(
			'update blog set title = "#arguments.T#", Author = "#arguments.A#", Content = "#arguments.Co#", Category = "#arguments.Cat#" where idblog = #arguments.BID#')
	}
}
