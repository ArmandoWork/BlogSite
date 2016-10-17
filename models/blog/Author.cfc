component persistent="true" table="ORM_Author" accessors="true"{
	property name="Authorid" fieldtype="id" generator="increment";
	property name="AuthorName" ormType="text";
	property name="Posts" singularname="Post" cfc="Post" fieldtype="one-to-many" type="array"; 
}