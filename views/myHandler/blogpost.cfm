<cfset blog = EntityLoad('Blog',url.id,true) />

<cfoutput>
	<div>
		<div>
			<h2>#blog.title#</h2>
			<p>#blog.Author#  #dateformat(blog.dateposted, 'dd-mm-yyyy')#</p>
		</div>
		<div>
			<p>#blog.Content#</p>
		</div>
		<div>
			<p><a href="##">#blog.Category#</a></p>
			<a href="/index.cfm/myHandler">Zurück zu dem Blog</a>
			<a href="/index.cfm/myHandler/editBlog.cfm?id=#blog.id#">Diesen Blog bearbeiten</a>
		</div>
	</div>
</cfoutput>

