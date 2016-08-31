component persistent="true"{
	property name="id" column="idblog" fieldtype="id" generator="increment";
	property name="title" ormtype="text";     
	property name="Author" ormtype="text";
	property name="dateposted" ormtype="timestamp";
	property name="Content" ormtype="text";
	property name="Category" ormtype="text";
}