<cfset blogs = EntityLoad('Blog') />

<h1>Blog</h1>


<cfoutput query="prc.myresult">

	<div>
		<div>
			<h2><a href="/index.cfm/myHandler/blogpost.cfm?id=#prc.myresult.idblog#">#prc.myresult.title#</a></h2>
			<p>#prc.myresult.Author#  #dateformat(prc.myresult.dateposted, 'dd-mm-yyyy')#</p>
		</div>
		<div>
			<p>#left(prc.myresult.Content, 50)# <a href="/index.cfm/myHandler/blogpost.cfm?id=#prc.myresult.idblog#">...</a></p>
		</div>
		<div>
			<p><a href="##">#prc.myresult.Category#</a></p>
		</div>
	</div>

</cfoutput>

<a href="/index.cfm/myHandler/addBlog.cfm">Blog hinzufügen</a>
<a href="/index.cfm/myHandler/deleteBlog.cfm">Blog löschen</a>