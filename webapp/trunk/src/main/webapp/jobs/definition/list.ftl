<html>
<head>
		<title><@s.text name="title.definitions.heading"/></title>
	    <link rel="stylesheet" href="${base}/include/js/jquery/tablesorter/themes/blue/style.css" type="text/css" media="print, projection, screen" />
		 <script type="text/javascript" src="${base}/include/js/jquery/tablesorter/jquery.tablesorter.min.js"></script>
<script type="text/javascript">
$(document).ready( function() {
	 $("#definitionTable").tablesorter({
	 		 widgets: ['zebra'],
	 		  headers: { 
            	// assign the secound column (we start counting zero) 
            	0: { 
                	// disable it by setting the property sorter to false 
                	sorter: false 
            	} 
            }
		});
	 //$("#summaryTable").tableHover(); 
});
 </script>
</head>
<body>
<h3><@s.text name="title.definitions.heading"/></h3>
<i><@s.text name="title.definitions.hint"/></i><br/>
<a href="edit.action"><@s.text name="label.create.definition"/></a>
<a href="raw.action"><@s.text name="label.dump"/></a>
<table id="definitionTable" cellspacing="0" cellpadding="3" width="100%"  class="tablesorter">
    <thead>
    <tr>
	<th class="{sorter: false}"><em><@s.text name="label.definitions.actions"/></em></th>
        <th><@s.text name="label.definitions.name"/></th>
        <th><@s.text name="label.definitions.description"/></th>
        <th><@s.text name="label.definitions.class"/></th>
        <th><@s.text name="label.definitions.params"/></th>      
   </tr>
   </thead><tbody>
    <#list definitions as def>
    <#if def_index % 2 == 0><tr ><#else><tr></#if>
        <td  nowrap="true"><a href="${base}/jobs/createDefinedJob.action?method=start&definitionName=${def.name!}"><@s.text name="label.global.createJob"/></a>
        <a href="edit.action?definitionName=${def.name!}"><@s.text name="label.global.edit"/></a>
        <a onclick="javascript:return confirm('<@s.text name="label.confirm.deleteDefinition"/>');" href="delete.action?definitionName=${def.name!}"><@s.text name="label.global.delete"/></a>
        </td>
        <td>${def.class} ${def.name!}</td>
        <td>${def.description!}</td>
        <td>${def.className!}</td>
        <td>
        <#if def.parameters?exists >
        <#assign params = def.parameters />
    	<#list params as p>
            <li>${p.name}: <@s.text name="label.global.required"/>=${p.required?string}</li>
     	</#list>
     	</#if>
        </td>
    </tr>
    </#list>
    </tbody>
    </table>
</body>
</html>