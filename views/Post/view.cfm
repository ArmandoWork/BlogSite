<cfoutput>
	<div>
		<h2>#prc.post.gettitle()#</h2>
		<p>#prc.post.getAuthor()#  #dateformat(prc.post.getdateposted(), 'dd-mm-yyyy')#</p>
	</div>
	<div>
		<p>#replace(prc.post.getContent(), chr(10), '<br>', 'all')#</p>
	</div>
	<div>
		<p><a href="##">#prc.post.getCategory()#</a></p>
		<a href="/index.cfm?event=post">Zurück zu dem Blog</a>
		<a href="/index.cfm?event=post.edit&id=#prc.post.getid()#">Diesen Blog bearbeiten</a>
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
		<cfinput type="hidden" name="Postid" value="#prc.post.getid()#" />
	</cfform>
</div>
<div>
	<h2>Comments:</h2>
	<cfif not isNull(rc.msg)>
		<cfoutput><p style="color: red;">#rc.msg#</p></cfoutput>
	</cfif>
	<cfoutput>
	<cfdump var="#prc.post.getComments()#"><cfabort>
	<cfloop array="#prc.post.getComments()#" index="comment">
		<div>
			<h3>#comment.getAuthor()# #dateformat(comment.getdateposted(), 'dd-mm-yyyy')#</h3>
		</div>
		<div>
			<p>#replace(comment.getComment(), chr(10), '<br>', 'all')#</p>
		</div>
		<div>
			<a href="/index.cfm?event=post.deleteC&id=#comment.getCommentid()#&Postid=#prc.post.getid()#">Comment löschen</a>
		</div>
	</cfloop>
	</cfoutput>
</div>



