<cfoutput>
	<cfif prc.post.idblog gt 0>
		<h1>Post bearbeiten</h1><br>
	<cfelse>
		<h1>Post hinzufügen</h1><br>
	</cfif>
</cfoutput>

<cfform action="/index.cfm?event=post.save">
<table>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Title">Titel*:</label></td>
		<td style="padding: 5px 0 5px 0;"><cfinput name="Title" type="text" value="#prc.post.title#"required="true"/></td>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Author">Author*:</label></td>
		<td style="padding: 5px 0 5px 0;"><cfinput name="Author" type="text" value="#prc.post.Author#"required="true"/></td>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Content">Content*:</label></td>
		<cfoutput><td style="padding: 5px 0 5px 0;"><textarea cols="150" rows="20" name="Content" required>#prc.post.Content#</textarea></td></cfoutput>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Category">Category*:</label></td>
		<td style="padding: 5px 0 5px 0;"><cfinput name="Category" type="text" value="#prc.post.Category#"required="true"/></td>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><cfinput name="submit" type="submit"/></td>
	</tr>
</table>
<cfinput type="hidden" name="id" value="#prc.post.idblog#" />
</cfform>
<br>
<a href="/index.cfm?event=post">Zurück zu dem Blog</a>


