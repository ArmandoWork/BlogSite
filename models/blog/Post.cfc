component persistent="true" table="ORM_Post" accessors="true"{
	property name="id" column="idblog" fieldtype="id" generator="increment";
	property name="title" ormtype="text";     
	property name="Author" ormtype="text";
	property name="dateposted" ormtype="timestamp";
	property name="Content" ormtype="text";
	property name="Category" ormtype="text";
	property name="Comments" singularname="Comment" fieldtype="one-to-many" cfc="Comment" type="array" fkcolumn="Postid";
}