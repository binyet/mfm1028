package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Client
 * 程序说明：客户管理
 * 版权信息:	山东金软科技股份有限公司
 * 时间：2017年10月13日 下午5:39:29
 * @author 鲁彬
 */
public class Client extends BaseModel{

	private static final long serialVersionUID = 1L;
	private Long id;//编号
	private String clientName;	//客户名称
	private String checi;//车次
	private String remark;//描述
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	/**
	 * @return the checi
	 */
	public String getCheci() {
		return checi;
	}
	/**
	 * @param checi the checi to set
	 */
	public void setCheci(String checi) {
		this.checi = checi;
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
