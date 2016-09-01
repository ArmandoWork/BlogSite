<h1>Blog</h1>
<cfif not isNull(rc.msg)>
<cfoutput><p style="font-color: red;">#rc.msg#</p></cfoutput>
</cfif>

<cfoutput query="prc.posts">

	<div>
		<div>
			<h2><a href="index.cfm?event=post.view&id=#prc.posts.idblog#">#prc.posts.title#</a></h2>
			<p>#prc.posts.Author#  #dateformat(prc.posts.dateposted, 'dd-mm-yyyy')#</p>
		</div>
		<div>
			<p>#left(prc.posts.Content, 50)# <a href="index.cfm?event=post.view&id=#prc.posts.idblog#">...</a></p>
		</div>
		<div>
			<p><a href="##">#prc.posts.Category#</a></p>
			<a href="/index.cfm?event=post.delete&id=#prc.posts.idblog#">Blog löschen</a>
		</div>
	</div>

</cfoutput>

<a href="/index.cfm?event=post.edit">Blog hinzufügen</a>
