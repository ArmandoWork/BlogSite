<h1>Blog</h1>
<cfif not isNull(rc.msg)>
<cfoutput><p style="color: red;">#rc.msg#</p></cfoutput>
</cfif>

<cfoutput>
	<cfloop array="#prc.posts#" index="post">
	<div>
		<div>
			<h2><a href="index.cfm?event=post.view&id=#post.getid()#">#post.gettitle()#</a></h2>
			<p>#post.getAuthor()#  #dateformat(post.getdateposted(), 'dd-mm-yyyy')#</p>
		</div>
		<div>
			<p>#left(post.getContent(), 50)# <a href="index.cfm?event=post.view&id=#post.getid()#">...</a></p>
		</div>
		<div>
			<p><a href="##">#post.getCategory()#</a></p>
			<a href="/index.cfm?event=post.delete&id=#post.getid()#">Blog löschen</a>
		</div>
	</div>
	</cfloop>
</cfoutput>

<a href="/index.cfm?event=post.edit">Blog hinzufügen</a>
