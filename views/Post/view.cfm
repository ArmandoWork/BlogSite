<cfoutput query="prc.post">
	<div>
			<h2>#prc.post.title#</h2>
			<p>#prc.post.Author#  #dateformat(prc.post.dateposted, 'dd-mm-yyyy')#</p>
		</div>
		<div>
			<p>#replace(prc.post.Content, chr(10), '<br>', 'all')#</p>
		</div>
		<div>
			<p><a href="##">#prc.post.Category#</a></p>
			<a href="/index.cfm?event=post">Zurück zu dem Blog</a>
			<a href="/index.cfm?event=post.edit&id=#prc.post.idblog#">Diesen Blog bearbeiten</a>
		</div>
	</div>
</cfoutput>

