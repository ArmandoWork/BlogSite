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
	<br>
</cfoutput>
<div>
	<h4>Add a Comment:</h4>
	<cfform action="/index.cfm?event=post.saveC">
		<table>
			<tr>
				<td style="padding: 5px 0 5px 0;"><label for="CA">Name*:</label></td>
				<td style="padding: 5px 0 5px 0;"><cfinput name="cA" type="text" required="true"/></td>
			</tr>
			<tr>
				<td style="padding: 5px 0 5px 0;"><label for="CC">Comment*:</label></td>
				<cfoutput><td style="padding: 5px 0 5px 0;"><textarea cols="150" rows="3" name="cC" required></textarea></td></cfoutput>
			</tr>
			<tr>
				<td style="padding: 5px 0 5px 0;"><cfinput name="submit" type="submit"/></td>
			</tr>
		</table>
		<cfinput type="hidden" name="id" value="#prc.post.idblog#" />
	</cfform>
</div>
<div>
	<h2>Comments:</h2>
	<cfif not isNull(rc.msg)>
		<cfoutput><p style="color: red;">#rc.msg#</p></cfoutput>
	</cfif>
	<cfoutput query="prc.comment">
		<div>
			<h3>#prc.comment.commentauthor#  <!---#dateformat(prc.comment.dateposted, 'dd-mm-yyyy')#---></h3>
		</div>
		<div>
			<p>#replace(prc.comment.comment, chr(10), '<br>', 'all')#</p>
		</div>
		<div>
			<a href="/index.cfm?event=post.deleteC&id=#prc.comment.id#&id2=#prc.post.idblog#">Comment löschen</a>
		</div>
	</cfoutput>
</div>



