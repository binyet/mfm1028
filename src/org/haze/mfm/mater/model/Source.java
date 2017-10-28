package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Source
 * 程序说明：记录矿料来源
 * 版权信息:
 * 时间：2017年10月14日 下午2:58:36
 * @author 鲁彬
 */
public class Source extends BaseModel{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;	//编号
	private String sourceName;	//来源名称
	private String remark; //备注
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSourceName() {
		return sourceName;
	}
	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
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
