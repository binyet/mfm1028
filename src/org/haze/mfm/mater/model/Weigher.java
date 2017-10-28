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
	private String remark;//备注
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
