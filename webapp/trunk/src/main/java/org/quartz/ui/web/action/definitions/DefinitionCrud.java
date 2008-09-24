/*
 * @since Jan 12, 2004
 * @version Revision: 
 * @author Matthew Payne
 *  TODO
 */
package org.quartz.ui.web.action.definitions;

import java.util.Collection;
import java.util.Map;

import org.quartz.ui.web.action.base.BaseAction;
import org.quartz.ui.web.model.JobDefinition;

/**
 * @author Matthew Payne Save update operations for a JobDefinition
 */
public class DefinitionCrud extends BaseAction {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork.Action#execute()
	 */

	/**
	 * 
	 */
	private static final long serialVersionUID = -4495359250775449787L;

	JobDefinition _definition = new JobDefinition();

	private String definitionName = "";

	Map paramMap;

	public String save() {

		JobDefinition def = BaseAction.getDefinitionManager().getDefinition(_definition.getName());
		if (def != null) {
			this._definition = def;

		} else {
			// save for a new
			if (paramMap != null) {
				_definition.getParameters().addAll(paramMap.values());
			}

			BaseAction.getDefinitionManager().addDefinition(_definition.getName(), _definition);
		}

		return SUCCESS;

	}

	@Override
	public String execute() {
		// assuming we are doing a new if no name supplied
		if (definitionName != null || definitionName.length() > 1) {
			// this is fine. No definition loaded(new)
			_definition = BaseAction.getDefinitionManager().getDefinition(definitionName);
		}

		return SUCCESS;
	}

	public Collection getDefinitions() {
		return getDefinitionManager().getDefinitions().values();
		//return getDefinitionManager().getDefinitions();
	}

	public String delete() {
		BaseAction.getDefinitionManager().removeDefinition(definitionName);
		return SUCCESS;
	}

	public String list() {
		return SUCCESS;
	}

	/**
	 * @return
	 */
	public String getDefinitionName() {
		return definitionName;
	}

	/**
	 * @param string
	 */
	public void setDefinitionName(String string) {
		definitionName = string;
	}

	/**
	 * @return JobDefinition
	 */
	public JobDefinition getDefinition() {
		return _definition;
	}

	/**
	 * @param definition
	 */
	public void setDefinition(JobDefinition definition) {
		this._definition = definition;
	}

	/**
	 * @return Returns the paramMap.
	 */
	public Map getParamMap() {
		return paramMap;
	}

	/**
	 * @param paramMap
	 *            The paramMap to set.
	 */
	public void setParamMap(Map paramMap) {
		this.paramMap = paramMap;
	}

}
