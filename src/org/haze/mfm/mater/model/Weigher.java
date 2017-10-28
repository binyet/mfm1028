package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Weigher
 * 程序说明：过磅人管理
 * 版权信息:	山东金软科技股份有限公司
 * 时间：2017年10月13日 下午5:39:29
 * @author 鲁彬
 */
public class Weigher extends BaseModel{

	private static final long serialVersionUID = 1L;
	private Long id;//编号
	private String weigherName;	//过磅人
	private String monitorName;//监磅人
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the weigherName
	 */
	public String getWeigherName() {
		return weigherName;
	}
	/**
	 * @param weigherName the weigherName to set
	 */
	public void setWeigherName(String weigherName) {
		this.weigherName = weigherName;
	}
	/**
	 * @return the monitorName
	 */
	public String getMonitorName() {
		return monitorName;
	}
	/**
	 * @param monitorName the monitorName to set
	 */
	public void setMonitorName(String monitorName) {
		this.monitorName = monitorName;
	}



	
	
}
