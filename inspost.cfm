<cfscript>

p =entityNew('Post');
p.setContent('some text');
p.setAuthor('Armando');
p.settitle('Titel1');
p.setCategory('Testing');
p.setdateposted(now());
entitySave(p);
writedump(p);
</cfscript>