<h1><@s.text name="title.viewJob"/></h1>
<form name="jobDetailForm" method="post" action="viewJobDetail.do">
<table>
	<tr>
		<td><@s.text name="label.job.group"/></td>
		<td><input type="hidden" name="groupName" value="${jobDetail.group}"/>${jobDetail.group}</td>
	</tr>
	<tr>
		<td><@s.text name="label.job.name"/></td>
		<td><input type="hidden" name="name" value="${jobDetail.name}">${jobDetail.name}</td>
	</tr>
	<tr>
		<td><@s.text name="label.job.jobClass"/></td>
		<td>${jobDetail.jobClass.name}</td>
	</tr>
	<tr>
		<td><@s.text name="label.job.description"/></td>
		<td>${jobDetail.description!}</td>
	</tr>
	<tr>
		<td><@s.text name="label.job.recover"/></td>
		<td><input type="checkbox" name="jobDetail.requestsRecovery" value="true" <#if jobDetail.requestsRecovery()> checked="true" </#if>></td>
	</tr>
	<tr>
		<td><@s.text name="label.job.durable"/></td>
		<td><input type="checkbox" name="jobDetail.durability" value="true"  <#if jobDetail.durable> checked="true" </#if>></td>
	</tr>
</table>

<h3><@s.text name="title.viewJob.listeners"/></h3>
<table>
</table>

<h3><@s.text name="title.viewJob.variables"/></h3>
<table>
	<table>

	<tr>
		<td><@s.text name="label.job.variable.key"/></td>
		<td><@s.text name="label.job.variable.value"/></td>
	</tr>
	<#list jobDetail.jobDataMap.keys as key>
	<tr>
		<td>${key}</td>
		<td>${jobDetail.jobDataMap.get(key)}</td>
	</tr>
	</#list>
</table>
<h3><@s.text name="title.viewJob.triggers"/></h3>
<table>
	<tr>
		<td><em><@s.text name="label.global.actions"/></em></td>
		<td><@s.text name="label.trigger.group"/></td>
		<td><@s.text name="label.trigger.name"/></td>
		<td><@s.text name="label.trigger.type"/></td>
		<td><@s.text name="label.trigger.nextFireTime"/></td>
	</tr>
	<#list jobTriggers as trigger>
	<tr>
		<td><a href="${base}/schedule/unschedule.action?jobName=${jobDetail.name}&jobGroup=${jobDetail.groupName!}&triggerGroup=${trigger.triggerGroup!}&triggerName=${trigger.triggerName!}"><@s.text name="label.global.unschedule"/></a></td>	
		<td>${trigger.triggerGroup}</td>	
		<td>${trigger.triggerName}</td>	
		<td>${trigger.type}</td>	
		<td>${trigger.nextFireTime}</td>	
		</tr>
	</#list>
</table>
<h3><@s.text name="label.global.actions"/></h3>
 &nbsp;<a href="${base}/jobs/editJob.action?jobName=${jobDetail.name}&jobGroup=${jobDetail.group}"><@s.text name="label.global.edit"/></a>
 &nbsp;<a href="${base}/jobs/deleteJob.action?jobName=${jobDetail.name}&jobGroup=${jobDetail.group}"><@s.text name="label.global.delete"/></a>
 &nbsp;<a href="${base}/jobs/executeJob.action?jobName=${jobDetail.name}&jobGroup=${jobDetail.group}"><@s.text name="label.global.executenow"/></a>
 &nbsp;<a href="${base}/schedule/startSchedule.action?jobName=${jobDetail.name}&jobGroup=${jobDetail.group}"><@s.text name="label.global.schedule"/></a>
 &nbsp;<a href="${base}/schedule/startCronSchedule.action?jobName=${jobDetail.name}&jobGroup=${jobDetail.group}"><@s.text name="label.global.schedule"/> cron</a>
 &nbsp;<a href="${base}/schedule/startUICronSchedule.action?jobName=${jobDetail.name}&jobGroup=${jobDetail.group}"><@s.text name="label.global.schedule"/> UI</a>
</form>
