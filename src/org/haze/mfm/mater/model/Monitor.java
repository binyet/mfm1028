package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：Monitor
 * 程序说明：监磅称重管理
 * 版权信息:	山东金软科技股份有限公司
 * 时间：2017年10月16日 下午5:39:29
 * @author 鲁彬
 */
public class Monitor extends BaseModel{

	private static final long serialVersionUID = 1L;
	private Long id;//编号
	private String property;	//性质
	private String source;		//来源
	private String client;		//客户
	private String carNum; 		//车号
	private String driver;		//司机
	private String maozhong;	//毛重
	private String pizhong;		//皮重
	private String jingzhong;		//净重
	private String checi;		//车次
	private String weigher;		//过磅人
	private String auditor;		//审核人
	private String weighDate;		//时间
	
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getPizhong() {
		return pizhong;
	}
	public void setPizhong(String pizhong) {
		this.pizhong = pizhong;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getWeighDate() {
		return weighDate;
	}
	public void setWeighDate(String weighDate) {
		this.weighDate = weighDate;
	}
	public String getMaozhong() {
		return maozhong;
	}
	public void setMaozhong(String maozhong) {
		this.maozhong = maozhong;
	}
	public String getJingzhong() {
		return jingzhong;
	}
	public void setJingzhong(String jingzhong) {
		this.jingzhong = jingzhong;
	}
	public String getWeigher() {
		return weigher;
	}
	public void setWeigher(String weigher) {
		this.weigher = weigher;
	}
	public String getCheci() {
		return checi;
	}
	public void setCheci(String checi) {
		this.checi = checi;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	
	
}
