package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：CheciHB
 * 程序说明：化验后数据明细信息，包括车次，性质等
 * 版权信息:
 * 时间：2017年10月20日 上午11:53:01
 * @author 鲁彬
 */
public class CheciHB extends BaseModel{
	private static final long serialVersionUID = 1L;
	private Long id;
	private String property;
	private String jingzhong;
	private String aresName;
	private String client;
	private String weighDate;
	private String checi;
	
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getJingzhong() {
		return jingzhong;
	}
	public void setJingzhong(String jingzhong) {
		this.jingzhong = jingzhong;
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
	/**
	 * @return the client
	 */
	public String getClient() {
		return client;
	}
	/**
	 * @param client the client to set
	 */
	public void setClient(String client) {
		this.client = client;
	}
	/**
	 * @return the weighDate
	 */
	public String getWeighDate() {
		return weighDate;
	}
	/**
	 * @param weighDate the weighDate to set
	 */
	public void setWeighDate(String weighDate) {
		this.weighDate = weighDate;
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

	
	
}
