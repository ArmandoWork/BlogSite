component accessors="false"{

function getcomment(cid){
	var myQuery = queryExecute(
			"SELECT * FROM comment
			WHERE id = #arguments.cid#" 
			);

	return myQuery;
}

function getcomments(postid){
	var myQuery = queryExecute(
			"SELECT * FROM comment
			WHERE postid = #arguments.postid#" 
			);

	return myQuery;
}

function addcomment(A, CC, postid){
	var myQuery = queryExecute("INSERT INTO comment(commentauthor, comment, postid) VALUES('#arguments.A#','#arguments.CC#','#arguments.postid#')");

}

function deletecomment(cid){
	var myQuery = queryExecute("DELETE FROM comment WHERE id = #arguments.cid#");
}

function updatecomment(cid, A, CC){
	var myQuery = queryExecute("update comment set commentauthor = '#arguments.A#' and comment = '#arguments.CC#' where id = #arguments.cid#");

}

}