package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;
import org.haze.base.util.EnumUtil;

/**
 * 
 * 程序名称：Dept 
 * 程序说明：投料单位维护
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年6月8日 下午1:58:41
 * @author 王亚茹
 */
public class Dept extends BaseModel{
	private static final long serialVersionUID = 1L;
	private Long id;//主键
	private String deptName;//名称  如氰一车间（一系统）
	private Long orgId;//组织id
	private String xiTong;//系统 字典维护
	private String xiTong_str;//
	private String orgName;//组织名称
	private String remark;//备注
	
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public Long getId() {
		return id;
	}
	public String getDeptName() {
		return deptName;
	}
	public Long getOrgId() {
		return orgId;
	}
	public String getXiTong() {
		return xiTong;
	}
	public String getXiTong_str() {
		if(null != getXiTong() && !getXiTong().equals("")){
			StringBuffer sb = new StringBuffer();
			String[] strArr = getXiTong().split(",");
			for (int i = 0; i < strArr.length; i++) {
				sb.append(EnumUtil.getPlatString(strArr[i]));
				if(i<strArr.length){
					sb.append(",");
				}
			}
			xiTong_str = sb.toString().substring(0,sb.length()-1);
		}
		return xiTong_str;
	}
	public String getRemark() {
		return remark;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public void setXiTong(String xiTong) {
		this.xiTong = xiTong;
	}
	public void setXiTong_str(String xiTong_str) {
		this.xiTong_str = xiTong_str;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
