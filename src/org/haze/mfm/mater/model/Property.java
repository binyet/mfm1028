package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Property
 * 程序说明：记录矿料性质
 * 版权信息:
 * 时间：2017年10月14日 下午2:58:36
 * @author 鲁彬
 */
public class Property extends BaseModel{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;	//编号
	private String propertyName;	//来源名称
	private String remark;		//备注
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
