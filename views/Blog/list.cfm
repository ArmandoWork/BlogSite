<h1>Blog</h1>
<cfif not isNull(rc.msg)>
<cfoutput><p style="color: red;">#rc.msg#</p></cfoutput>
</cfif>

<cfoutput>
	<cfloop array="#prc.posts#" index="post">
	<div class="row">
		<div class="col-md-12">
			<h2><a href="index.cfm?event=blog.view&id=#post.getid()#">#post.gettitle()#</a></h2>
			<p>#post.getAuthor().getAuthorName()#  #dateformat(post.getdateposted(), 'dd-mm-yyyy')#</p>
		</div>
		<div class="col-md-12">
			<p>#left(post.getContent(), 50)# <a href="index.cfm?event=blog.view&id=#post.getid()#">...</a></p>
		</div>
		<div class="col-md-12">
			<p><a href="##">#post.getCategory()#</a></p>
			<a href="/index.cfm?event=blog.delete&id=#post.getid()#">Post löschen</a>
		</div>
	</div>
	</cfloop>
</cfoutput>
</br></br>
<div class="row">
	<div class="col-md-12">
	<a href="/index.cfm?event=blog.edit">Neue Post</a>
	</div>
</div>
