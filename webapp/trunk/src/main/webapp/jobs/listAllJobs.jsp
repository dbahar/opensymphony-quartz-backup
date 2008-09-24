<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
<s:set name="jobz" value="jobs" scope="request" />
<h1><s:text name="title.listAllJobs" /></h1>
Find job(s) by name:
<br />
<form name="JobSearchForm" method="post"
	action="listJobs.action"><input type="text"
	name="jobName" value="<s:property value="jobName"/>" /> <input
	type="submit" value="Search" name="jobSearchSubmit" /></form>
<br />
<br />
<display:table name="jobz" class="simple" id="row"
	requestURI="listJobs.action">
	<display:column titleKey="label.global.actions">
		<s:url id="viewLink" value='/jobs/viewJob.action'>
			<s:param name="jobName">${row.name}</s:param>
			<s:param name="jobGroup">${row.group}</s:param>
		</s:url>
		<s:url id="editLink" value='/jobs/editJob.action'>
			<s:param name="jobName">${row.name}</s:param>
			<s:param name="jobGroup">${row.group}</s:param>
		</s:url>
		<s:url id="executeJob"
			value='/jobs/executeJob.action'>
			<s:param name="jobName">${row.name}</s:param>
			<s:param name="jobGroup">${row.group}</s:param>
		</s:url>
		<a href='${viewLink}'><s:text name="label.global.view" /></a> |
	<a href='${editLink}'><s:text name="label.global.edit" /></a> |
	<a href='${executeLink}'><s:text name="label.global.execute" /></a>
	</display:column>
	<display:column property="group" titleKey="label.job.group"
		sortable="true" />
	<display:column property="name" titleKey="label.job.name"
		sortable="true" />
	<display:column property="description" titleKey="label.job.description" />
	<display:column property="jobClass" titleKey="label.job.jobClass"
		sortable="true" />
</display:table>
<script language="Javascript">
	try {
		document.JobSearchForm.jobName.focus()
	} catch (e) {
	}
</script>

</body>
</html>