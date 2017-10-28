package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Ares 
 * 程序说明：区域管理
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月14日 下午4:55:24
 * @author 王亚茹
 */
public class Ares extends BaseModel{
	private static final long serialVersionUID = 1L;
	private Long id;//主键
	private String aresName;//区域名称
	private String aresMianji;//面积
	private String aresRongliang;//可容纳量
	private String remark;//备注
	public Long getId() {
		return id;
	}
	public String getAresName() {
		return aresName;
	}
	public String getAresMianji() {
		return aresMianji;
	}
	public String getAresRongliang() {
		return aresRongliang;
	}
	public String getRemark() {
		return remark;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setAresName(String aresName) {
		this.aresName = aresName;
	}
	public void setAresMianji(String aresMianji) {
		this.aresMianji = aresMianji;
	}
	public void setAresRongliang(String aresRongliang) {
		this.aresRongliang = aresRongliang;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
