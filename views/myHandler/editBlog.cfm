<cfset blog = EntityLoad('Blog',url.id,true) />

<cfparam name="form.submitedit" default="0"/>
<cfparam name="form.Title" default="#blog.title#"/>
<cfparam name="form.Author" default="#blog.Author#"/>
<cfparam name="form.Content" default="#blog.Content#"/>
<cfparam name="form.Category" default="#blog.Category#"/>

<h1>Blog bearbeiten</h1><br>

<cfform action="/index.cfm/myHandler/editBlog.cfm?id=#blog.id#">
<table>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Title">Titel:</label></td>
		<td style="padding: 5px 0 5px 0;"><cfinput name="Title" type="text" value="#form.title#" required="true"/></td>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Author">Author:</label></td>
		<td style="padding: 5px 0 5px 0;"><cfinput name="Author" type="text" value="#form.Author#" required="true"/></td>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Content">Content:</label></td>
		<cfoutput><td style="padding: 5px 0 5px 0;"><textarea cols="150" rows="20" name="Content" required>#form.Content#</textarea></td></cfoutput>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><label for="Category">Category:</label></td>
		<td style="padding: 5px 0 5px 0;"><cfinput name="Category" type="text" value="#form.Category#" required="true"/></td>
	</tr>
	<tr>
		<td style="padding: 5px 0 5px 0;"><cfinput name="submit" type="submit"/></td>
	</tr>
</table>
<cfinput type="hidden" name="BlogID" value="#blog.id#">
<input type="hidden" name="submitedit" value="1" />
</cfform>
<cfscript>
if(form.submitedit)
{
	if( len(trim(form.Title)) && len(trim(form.Author)) && len(trim(form.Content)) && len(trim(form.Category)))
	{
		getModel('mymodel').editBlog(form.BlogID, form.Title, form.Author, form.Content, form.Category);
		writeOutput("Blog bearbeitet");
	}
	else
	{
		writeOutput("Fehler beim updaten des Blogs!");
	}
}
</cfscript>
<br>
<cfoutput><a href="/index.cfm/myHandler/blogpost.cfm?id=#blog.id#">Zurück zu diesem Blog</a></cfoutput>