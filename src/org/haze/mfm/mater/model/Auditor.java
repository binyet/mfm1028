package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Auditor
 * 程序说明：监磅人管理
 * 版权信息:
 * 时间：2017年10月28日 下午7:47:54
 * @author 鲁彬
 */
public class Auditor extends BaseModel {
	private static final long serialVersionUID = 1L;
	private Long id;	//监磅人ID
	private String auditor;		//监磅人姓名
	private String remark;		//备注

	/**
	 * @return the auditor
	 */
	public String getAuditor() {
		return auditor;
	}
	/**
	 * @param auditor the auditor to set
	 */
	public void setAuditor(String auditor) {
		this.auditor = auditor;
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
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
}
