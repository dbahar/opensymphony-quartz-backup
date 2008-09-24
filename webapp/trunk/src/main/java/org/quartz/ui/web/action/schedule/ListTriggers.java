package org.quartz.ui.web.action.schedule;

import java.util.ArrayList;
import java.util.List;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;

public class ListTriggers extends ScheduleBase {

	/**
     * 
     */
    private static final long serialVersionUID = -5522888318824166108L;
	String jobName="";
	String jobGroup=""; 
	String triggerGroup = "";
		
	private List triggerList = new ArrayList();
	
	/**
	 * Returns the jobs.
	 * @return ArrayList
	 */
	public java.util.List getTriggers() {
		return  triggerList;
	}
	
				
	@Override
	public String execute() throws Exception  {

	  	  Scheduler scheduler = ScheduleBase.getCurrentScheduler();
			this.triggerList = new ArrayList();		

				try {

					String[] triggerGroups = scheduler.getTriggerGroupNames();
							
							for (String groupName : triggerGroups) {
								String[] triggerNames = scheduler.getTriggerNames(groupName);
								for (String triggerName : triggerNames) {
									Trigger trigger =
										scheduler.getTrigger(triggerName, groupName);
					
								/*	tForm.setDescription(trigger.getDescription());
									tForm.setJobGroup(trigger.getJobGroup());
									tForm.setJobName(trigger.getJobName());
									tForm.setMisFireInstruction(trigger.getMisfireInstruction());
				
									tForm.setStartTime(Util.getDateAsString(trigger.getStartTime()));
									tForm.setStopTime(Util.getDateAsString(trigger.getEndTime()));
				
									tForm.setTriggerGroup(trigger.getGroup());
									tForm.setTriggerName(trigger.getName());
				
									tForm.setNextFireTime(Util.getDateAsString(trigger.getNextFireTime()));
									tForm.setPreviousFireTime(Util.getDateAsString(trigger.getPreviousFireTime()));
									tForm.setType(Util.getTriggerType(trigger));*/
								
								this.triggerList.add(trigger);
								
							}
						}
							
				} catch (SchedulerException e) {
					LOG.error("Problem listing triggers, schedule may be paused or stopped", e);
			   }
			
		return SUCCESS;

		}



}
