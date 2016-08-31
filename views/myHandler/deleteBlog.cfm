<cfparam name="form.submitdel" default="0"/>
<cfparam name="form.Titledel" default=""/>
<cfparam name="form.Authordel" default=""/>

<h1>Blog löschen</h1>

<p>Bitte geben Sie den Titel und Author des Blogs an, welcher Sie löschen wollen:<br></p>
<cfform action="/index.cfm/myHandler/deleteBlog.cfm">
<table>
	<tr>
		<td><label for="Titledel">Titel:</label></td>
		<td><cfinput name="Titledel" type="text" required="true"/></td>
	</tr>
	<tr>
		<td><label for="Authordel">Author:</label></td>
		<td><cfinput name="Authordel" type="text" required="true"/></td>
	</tr>
	<tr>
		<td><cfinput name="submit" type="submit"/></td>
	</tr>
</table>
<input type="hidden" name="submitdel" value="1" />
</cfform>
<cfscript>
	if (form.submitdel)
	{
		i = 1;
		for (row in prc.myresult)
		{
			if (prc.myresult.title == form.Titledel && prc.myresult.Author == form.Authordel)
			{
				getModel('mymodel').deleteBlog(form.Titledel, form.Authordel);
				writeOutput("Blog gelöscht!");
				i = 0;
			}
		}
		if(i)
		{
			writeOutput("Blog existiert nicht!");
		}
	}
</cfscript>
<br>
<a href="/index.cfm/myHandler">Zurück zu dem Blog</a>