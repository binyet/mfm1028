package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Report
 * 程序说明：化验结果
 * 版权信息:
 * 时间：2017年10月26日 上午8:10:29
 * @author 鲁彬
 */
public class Report extends BaseModel {
	private static final long serialVersionUID = 1L;
	private Long id;//id
	private Long taskId;//任务id
	private String type;//报告单类型  氰化/浮选
	private String nongdu;//浓度
	private String xidu;//细度
	private String PH;//PH值
	private String huangyao;//黄药
	private String heiyao; //黑药
	private String oil;//浮选油
//	private String Nacn;//实验条件浓度NaCN
//	private String Cao;//实验条件浓度CaO
//	private String kuangjiang;//实验条件矿浆
//	private String mokuang;//实验条件磨矿
//	private String outTime;//浸出时间
//	private String mokuangXD;//磨矿细度
	private String zhaAu;//Au渣品位
	private String zhaAg;//Ag渣品位
//	private String leachAu;//Au浸出率
//	private String leachAg;//Ag浸出率
	private String consumeNaCN;//NaCN药剂耗量
	private String consumeCaO;//CaO药剂耗量
	private String state;//状态  0未提交  1原始单已提交  2上报单已提交
//	private String remark;//备注
//	private String time;//报告单报出时间
//	private String man;//填写人
	
	private String banci;//班次
	private String train;//车次
	private String aresName;//区域名称
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getTaskId() {
		return taskId;
	}
	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNongdu() {
		return nongdu;
	}
	public void setNongdu(String nongdu) {
		this.nongdu = nongdu;
	}
	public String getXidu() {
		return xidu;
	}
	public void setXidu(String xidu) {
		this.xidu = xidu;
	}
	public String getPH() {
		return PH;
	}
	public void setPH(String pH) {
		PH = pH;
	}
	public String getHuangyao() {
		return huangyao;
	}
	public void setHuangyao(String huangyao) {
		this.huangyao = huangyao;
	}
	public String getHeiyao() {
		return heiyao;
	}
	public void setHeiyao(String heiyao) {
		this.heiyao = heiyao;
	}
	public String getOil() {
		return oil;
	}
	public void setOil(String oil) {
		this.oil = oil;
	}
//	public String getNacn() {
//		return Nacn;
//	}
//	public void setNacn(String nacn) {
//		Nacn = nacn;
//	}
//	public String getCao() {
//		return Cao;
//	}
//	public void setCao(String cao) {
//		Cao = cao;
//	}
//	public String getKuangjiang() {
//		return kuangjiang;
//	}
//	public void setKuangjiang(String kuangjiang) {
//		this.kuangjiang = kuangjiang;
//	}
//	public String getOutTime() {
//		return outTime;
//	}
//	public void setOutTime(String outTime) {
//		this.outTime = outTime;
//	}
//	public String getMokuangXD() {
//		return mokuangXD;
//	}
//	public void setMokuangXD(String mokuangXD) {
//		this.mokuangXD = mokuangXD;
//	}
	public String getZhaAu() {
		return zhaAu;
	}
	public void setZhaAu(String zhaAu) {
		this.zhaAu = zhaAu;
	}
	public String getZhaAg() {
		return zhaAg;
	}
	public void setZhaAg(String zhaAg) {
		this.zhaAg = zhaAg;
	}
//	public String getLeachAu() {
//		return leachAu;
//	}
//	public void setLeachAu(String leachAu) {
//		this.leachAu = leachAu;
//	}
//	public String getLeachAg() {
//		return leachAg;
//	}
//	public void setLeachAg(String leachAg) {
//		this.leachAg = leachAg;
//	}
	public String getConsumeNaCN() {
		return consumeNaCN;
	}
	public void setConsumeNaCN(String consumeNaCN) {
		this.consumeNaCN = consumeNaCN;
	}
	public String getConsumeCaO() {
		return consumeCaO;
	}
	public void setConsumeCaO(String consumeCaO) {
		this.consumeCaO = consumeCaO;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
//	public String getRemark() {
//		return remark;
//	}
//	public void setRemark(String remark) {
//		this.remark = remark;
//	}
//	public String getTime() {
//		return time;
//	}
//	public void setTime(String time) {
//		this.time = time;
//	}
//	public String getMan() {
//		return man;
//	}
//	public void setMan(String man) {
//		this.man = man;
//	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
//	public String getMokuang() {
//		return mokuang;
//	}
//	public void setMokuang(String mokuang) {
//		this.mokuang = mokuang;
//	}
	/**
	 * @return the banci
	 */
	public String getBanci() {
		return banci;
	}
	/**
	 * @param banci the banci to set
	 */
	public void setBanci(String banci) {
		this.banci = banci;
	}
	/**
	 * @return the train
	 */
	public String getTrain() {
		return train;
	}
	/**
	 * @param train the train to set
	 */
	public void setTrain(String train) {
		this.train = train;
	}
	/**
	 * @return the aresName
	 */
	public String getAresName() {
		return aresName;
	}
	/**
	 * @param aresName the aresName to set
	 */
	public void setAresName(String aresName) {
		this.aresName = aresName;
	}
	
	
}
