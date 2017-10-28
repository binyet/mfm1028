package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：PkxxDetail 
 * 程序说明：配矿详细信息
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月16日 下午3:24:00
 * @author 王亚茹
 */
public class PkxxDetail extends BaseModel{
	private static final long serialVersionUID = 1L;
	private Long id;//主键
	private Long pkxxId;//配矿信息id 主表id
	private Long stockDetailId;//库存详细表id
	
	//2016-06-04 查询用
	private String cbId;//客户
	private String name;//客户名称
	private String checi;//车次
	private String wetMine;//湿重
	private String darkMine;//干重
	private String wet;//水分
	private String tasteAu;//金品位
	private String conAu;//金含量
	private String tasteAg;//银品位
	private String conAg;//银含量
	private String tasteS;//硫品位
	private String conS;//硫含量
	private String jinzhaAu;//金浸渣
	private String jinzhaAg;//银浸渣
	private String haoyao;//耗药
	private String cu;//铜
	private String pb;//铅
	private String zn;//锌
	private String arsenic;//砷
	private String sb;//锑
	
	public String getCbId() {
		return cbId;
	}
	public String getName() {
		return name;
	}
	public String getCheci() {
		return checi;
	}
	public String getWetMine() {
		return wetMine;
	}
	public String getDarkMine() {
		return darkMine;
	}
	public String getWet() {
		return wet;
	}
	public String getTasteAu() {
		return tasteAu;
	}
	public String getConAu() {
		return conAu;
	}
	public String getTasteAg() {
		return tasteAg;
	}
	public String getConAg() {
		return conAg;
	}
	public String getTasteS() {
		return tasteS;
	}
	public String getConS() {
		return conS;
	}
	public String getJinzhaAu() {
		return jinzhaAu;
	}
	public String getJinzhaAg() {
		return jinzhaAg;
	}
	public String getHaoyao() {
		return haoyao;
	}
	public String getCu() {
		return cu;
	}
	public String getPb() {
		return pb;
	}
	public String getZn() {
		return zn;
	}
	public String getArsenic() {
		return arsenic;
	}
	public String getSb() {
		return sb;
	}
	public void setCbId(String cbId) {
		this.cbId = cbId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setCheci(String checi) {
		this.checi = checi;
	}
	public void setWetMine(String wetMine) {
		this.wetMine = wetMine;
	}
	public void setDarkMine(String darkMine) {
		this.darkMine = darkMine;
	}
	public void setWet(String wet) {
		this.wet = wet;
	}
	public void setTasteAu(String tasteAu) {
		this.tasteAu = tasteAu;
	}
	public void setConAu(String conAu) {
		this.conAu = conAu;
	}
	public void setTasteAg(String tasteAg) {
		this.tasteAg = tasteAg;
	}
	public void setConAg(String conAg) {
		this.conAg = conAg;
	}
	public void setTasteS(String tasteS) {
		this.tasteS = tasteS;
	}
	public void setConS(String conS) {
		this.conS = conS;
	}
	public void setJinzhaAu(String jinzhaAu) {
		this.jinzhaAu = jinzhaAu;
	}
	public void setJinzhaAg(String jinzhaAg) {
		this.jinzhaAg = jinzhaAg;
	}
	public void setHaoyao(String haoyao) {
		this.haoyao = haoyao;
	}
	public void setCu(String cu) {
		this.cu = cu;
	}
	public void setPb(String pb) {
		this.pb = pb;
	}
	public void setZn(String zn) {
		this.zn = zn;
	}
	public void setArsenic(String arsenic) {
		this.arsenic = arsenic;
	}
	public void setSb(String sb) {
		this.sb = sb;
	}
	public Long getId() {
		return id;
	}
	public Long getPkxxId() {
		return pkxxId;
	}
	public Long getStockDetailId() {
		return stockDetailId;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setPkxxId(Long pkxxId) {
		this.pkxxId = pkxxId;
	}
	public void setStockDetailId(Long stockDetailId) {
		this.stockDetailId = stockDetailId;
	}
	
}
