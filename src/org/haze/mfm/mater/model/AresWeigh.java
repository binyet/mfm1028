package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：AresWeigh
 * 程序说明：表示每个区域的总体信息，只包括性质，重量，区域名称信息
 * 版权信息:
 * 时间：2017年10月20日 上午11:53:01
 * @author 鲁彬
 */
public class AresWeigh extends BaseModel{
	private static final long serialVersionUID = 1L;
	private Long id;
	private String property;
	private String jingzhong;
	private String aresName;
	private String checiJson;//车次json  为了取出车次信息的Id

	
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
	 * @return the checiJson
	 */
	public String getCheciJson() {
		return checiJson;
	}
	/**
	 * @param checiJson the checiJson to set
	 */
	public void setCheciJson(String checiJson) {
		this.checiJson = checiJson;
	}

	
	
}
