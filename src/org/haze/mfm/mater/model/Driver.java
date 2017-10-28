package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Driver
 * 程序说明：司机管理
 * 版权信息:	山东金软科技股份有限公司
 * 时间：2017年10月13日 下午5:39:29
 * @author 鲁彬
 */
public class Driver extends BaseModel{

	private static final long serialVersionUID = 1L;
	private Long id;//编号
	private String driverName;	//司机名称
	private String clientName; 	//客户名称
	private String remark; 		//备注
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the driverName
	 */
	public String getDriverName() {
		return driverName;
	}
	/**
	 * @param driverName the driverName to set
	 */
	public void setDriverName(String driverName) {
		this.driverName = driverName;
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
	 * @return the clientName
	 */
	public String getClientName() {
		return clientName;
	}
	/**
	 * @param clientName the clientName to set
	 */
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}



	
	
}
