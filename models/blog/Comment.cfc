component persistent="true" table="ORM_Comment" accessors="true"{
	property name="Commentid" fieldtype="id" generator="increment";    
	property name="Author" ormtype="text";
	property name="dateposted" ormtype="timestamp";
	property name="Comment" ormtype="text";
}