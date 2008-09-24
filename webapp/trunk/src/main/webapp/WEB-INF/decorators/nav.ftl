<#if session.getValue("User.SESSION_NAME")?exists>
	<#assign currentUser = session.getValue("User.SESSION_NAME")/>
</#if>
		<a href="${base}/schedule/scheduleControl.action">Schedule Control</a><br/>
		<a href="${base}/jobs/definition/list.action">Job Definitions</a><br/>
		<a href="${base}/jobs/createJob.action">Create Job</a><br/>
		<a href="${base}/schedule/listJobs.action">List Jobs</a><br/>
		<a href="${base}/schedule/listTriggers.action">List all Triggers</a><br/>
