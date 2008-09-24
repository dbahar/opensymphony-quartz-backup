<#if jobDefinition?exists>
<#assign def = jobDefinition/>
</#if>
<h1><@s.text name="title.createJob"/></h1>
<form name="jobDetailForm" method="post" action="saveJob.action">
<table>
	<tr>
		<td><@s.text name="label.job.group"/></td>
		<td><input type="text" id="q" name="jobDetail.group" value="${jobDetail.group!}"/></td>
	</tr>
	<tr>
		<td><@s.text name="label.job.name"/></td>
		<td><input type="text" name="jobDetail.name" value="${jobDetail.name!}"/> </td>
	</tr>
	<tr>
		<td><@s.text name="label.job.jobClass"/></td>
		
		<td><input type="text" name="className" value="${className!}${(jobDetail.jobClass.name)!}" /></td>
	</tr> 																			<#-- put one or the other -->
	<tr>
		<td><@s.text name="label.job.description"/></td>
		<td><textarea name="jobDetail.description">${jobDetail.description!}</textarea></td>
	</tr>
	<tr>
		<td><@s.text name="label.job.recover"/></td>
		<td><input type="checkbox" name="jobDetail.requestsRecovery" value="true" <#if jobDetail.requestsRecovery()> checked="true" </#if> /></td>
	</tr>
	<tr>
		<td><@s.text name="label.job.durable"/></td>
		<td><input type="checkbox" name="jobDetail.durability" value="true"  <#if jobDetail.durable> checked="true" </#if> /></td>
	</tr>
</table>
<h3><@s.text name="title.createJob.listeners"/></h3>
<!-- todo add job listener functionality -->
<table>
</table>

<h3><@s.text name="title.createDefinitionJob.params"/></h3>
<table>
	<tr>
		<td><@s.text name="label.job.parameter.name"/></td>
		<td><@s.text name="label.job.parameter.value"/></td>
		<td><@s.text name="label.job.parameter.required"/></td>
	</tr>
<#if jobDefinition?exists>
<#assign params = jobDefinition.parameters/>
<#list params as p>
    <tr>
    	<td>${p.name}:  </td>
    	<td><input type="text" name="param.${p.name}"/></td>
    	<td>${p.required?string}</td>
    </tr>
</#list>
</#if>
    <#list jobDetail.jobDataMap.keys as key>
	<tr>
		<td><input type="text" name="parameterNames" value="${key}"/></td>
		<td><input type="text" name="parameterValues" value="${jobDetail.jobDataMap.getString(key)}"/></td>
	</tr>
	</#list>
    <tr>
    	<td><input type="text" name="parameterNames"/></td>
    	<td><input type="text" name="parameterValues"/></td>
    </tr>
    <tr>
    	<td><input type="text" name="parameterNames"/></td>
    	<td><input type="text" name="parameterValues"/></td>
    </tr>
</table>
<input type="hidden" name="definitionName" value="${(jobDefinition.name)!}" />
<input type="submit"  class="submit" name="saveAction" value="<@s.text name="label.global.save"/>"/>
</form>