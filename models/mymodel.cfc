/**
* I am a new Model Object
*/
component accessors="true"{
	
    // Properties
    

    /**
     * Constructor
     */
	mymodel function init(){
		
		return this;
	}

	function getblog ()
	{
		var myQuery = queryExecute(
			"SELECT * from blog" 
			 
			);
		return myquery;
	}
	
	function addblog(T, A, Co, Cat)
	{
		var myQuery = queryExecute(
			'INSERT INTO blog(title, Author, Content, Category, dateposted, blogpostid) VALUES ("#arguments.T#", "#arguments.A#", "#arguments.Co#", "#arguments.Cat#", now(), 0) ');
	}

	function deleteBlog(T, A)
	{
		var myQuery = queryExecute('DELETE FROM blog WHERE title="#arguments.T#" and Author="#arguments.A#"');
	}

	function editblog(BID, T, A, Co, Cat)
	{
		var myQuery = queryExecute(
			'update blog set title = "#arguments.T#", Author = "#arguments.A#", Content = "#arguments.Co#", Category = "#arguments.Cat#" where idblog = #arguments.BID#')
	}
}
