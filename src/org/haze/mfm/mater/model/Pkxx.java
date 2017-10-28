package org.haze.mfm.mater.model;

import java.util.Date;

import org.haze.base.model.BaseModel;
import org.haze.base.util.DateUtil;
import org.haze.base.util.EnumUtil;

/**
 * 
 * 程序名称：Pkxx 
 * 程序说明：配矿信息
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月16日 下午3:07:11
 * @author 王亚茹
 */
public class Pkxx extends BaseModel{
	private static final long serialVersionUID = 1L;
	private Long id;//主键
	private String touliaoDept;//投料单位
	private Long orgId;//投料单位的组织id
	private String touliaoXz;//投料性质 氧化硫化
	private String pkDate;//配矿时间
	private String pkPerson;//配矿人
	private String pkWetMine;//湿矿
	private String pxDarkMine;//干矿
	private String pkTasteAu;//金品位
	private String pkConAu;//金含量
	private String pkTasteAg;//银品位
	private String pkConAg;//银含量
	private String pkConS;//硫含量
	private String pkConCu;//铜含量
	private String pkConPb;//铅含量
	private String pkConZn;//锌含量
	private String pkConAs;//砷含量
	private String pkConSb;//锑含量
	private String pkJinzhaAu;//金浸渣含量
	private String pkJinzhaAg;//银浸渣含量
	private String pkHaoyao;//总耗药
	private String remark;//备注
	private String checiJson;//车次json  为了取出车次信息的Id
	private String touliaoDept_str;
	private String touliaoXz_str;
	private String fullName;//配矿人姓名
	private String deptName;//投料单位的名称
	
	private String upd;//updjb 表示修改基本信息  updzj表示修改数据增加车次  updsc表示修改数据 删除车次
	public Pkxx(){
		pkDate = DateUtil.getString(new Date(), "yyyy-MM-dd");
	}
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getUpd() {
		return upd;
	}
	public void setUpd(String upd) {
		this.upd = upd;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getCheciJson() {
		return checiJson;
	}
	public void setCheciJson(String checiJson) {
		this.checiJson = checiJson;
	}
	public String getTouliaoDept_str() {
		if(null != getTouliaoDept() && !getTouliaoDept().equals("")){
			StringBuffer sb = new StringBuffer();
			String[] strArr = getTouliaoDept().split(",");
			for (int i = 0; i < strArr.length; i++) {
				sb.append(EnumUtil.getPlatString(strArr[i]));
				if(i<strArr.length){
					sb.append(",");
				}
			}
			touliaoDept_str = sb.toString().substring(0,sb.length()-1);
		}
		return touliaoDept_str;
	}
	public String getTouliaoXz_str() {
		if(null != getTouliaoXz() && !getTouliaoXz().equals("")){
			StringBuffer sb = new StringBuffer();
			String[] strArr = getTouliaoXz().split(",");
			for (int i = 0; i < strArr.length; i++) {
				sb.append(EnumUtil.getPlatString(strArr[i]));
				if(i<strArr.length){
					sb.append(",");
				}
			}
			touliaoXz_str = sb.toString().substring(0,sb.length()-1);
		}
		return touliaoXz_str;
	}
	public void setTouliaoDept_str(String touliaoDept_str) {
		this.touliaoDept_str = touliaoDept_str;
	}
	public void setTouliaoXz_str(String touliaoXz_str) {
		this.touliaoXz_str = touliaoXz_str;
	}
	public Long getId() {
		return id;
	}
	public String getTouliaoDept() {
		return touliaoDept;
	}
	public String getTouliaoXz() {
		return touliaoXz;
	}
	public String getPkDate() {
		return pkDate;
	}
	public String getPkPerson() {
		return pkPerson;
	}
	public String getPkWetMine() {
		return pkWetMine;
	}
	public String getPxDarkMine() {
		return pxDarkMine;
	}
	public String getPkTasteAu() {
		return pkTasteAu;
	}
	public String getPkConAu() {
		return pkConAu;
	}
	public String getPkTasteAg() {
		return pkTasteAg;
	}
	public String getPkConAg() {
		return pkConAg;
	}
	public String getPkConS() {
		return pkConS;
	}
	public String getPkConCu() {
		return pkConCu;
	}
	public String getPkConPb() {
		return pkConPb;
	}
	public String getPkConZn() {
		return pkConZn;
	}
	public String getPkConAs() {
		return pkConAs;
	}
	public String getPkConSb() {
		return pkConSb;
	}
	public String getPkJinzhaAu() {
		return pkJinzhaAu;
	}
	public String getPkJinzhaAg() {
		return pkJinzhaAg;
	}
	public String getPkHaoyao() {
		return pkHaoyao;
	}
	public String getRemark() {
		return remark;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setTouliaoDept(String touliaoDept) {
		this.touliaoDept = touliaoDept;
	}
	public void setTouliaoXz(String touliaoXz) {
		this.touliaoXz = touliaoXz;
	}
	public void setPkDate(String pkDate) {
		this.pkDate = pkDate;
	}
	public void setPkPerson(String pkPerson) {
		this.pkPerson = pkPerson;
	}
	public void setPkWetMine(String pkWetMine) {
		this.pkWetMine = pkWetMine;
	}
	public void setPxDarkMine(String pxDarkMine) {
		this.pxDarkMine = pxDarkMine;
	}
	public void setPkTasteAu(String pkTasteAu) {
		this.pkTasteAu = pkTasteAu;
	}
	public void setPkConAu(String pkConAu) {
		this.pkConAu = pkConAu;
	}
	public void setPkTasteAg(String pkTasteAg) {
		this.pkTasteAg = pkTasteAg;
	}
	public void setPkConAg(String pkConAg) {
		this.pkConAg = pkConAg;
	}
	public void setPkConS(String pkConS) {
		this.pkConS = pkConS;
	}
	public void setPkConCu(String pkConCu) {
		this.pkConCu = pkConCu;
	}
	public void setPkConPb(String pkConPb) {
		this.pkConPb = pkConPb;
	}
	public void setPkConZn(String pkConZn) {
		this.pkConZn = pkConZn;
	}
	public void setPkConAs(String pkConAs) {
		this.pkConAs = pkConAs;
	}
	public void setPkConSb(String pkConSb) {
		this.pkConSb = pkConSb;
	}
	public void setPkJinzhaAu(String pkJinzhaAu) {
		this.pkJinzhaAu = pkJinzhaAu;
	}
	public void setPkJinzhaAg(String pkJinzhaAg) {
		this.pkJinzhaAg = pkJinzhaAg;
	}
	public void setPkHaoyao(String pkHaoyao) {
		this.pkHaoyao = pkHaoyao;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
