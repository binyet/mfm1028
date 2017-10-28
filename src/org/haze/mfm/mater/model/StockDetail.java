package org.haze.mfm.mater.model;

import org.haze.base.model.BaseModel;

/**
 * 
 * 程序名称：StockDetail 程序说明：库存详细表 版权信息:山东金软科技股份有限公司 时间：2016年5月16日 下午1:58:52
 * 
 * @author 王亚茹
 */
public class StockDetail extends BaseModel {
	private static final long serialVersionUID = 1L;
	private Long id;// 主键
	private Long stockId;// 库存表id 主表id
	private String cbId;// 客户
	private String name;// 客户名称
	private String checi;// 车次
	private String wetMine;// 湿重
	private String darkMine;// 干重
	private String wet;// 水分
	private String tasteAu;// 金品位
	private String conAu;// 金含量
	private String tasteAg;// 银品位
	private String conAg;// 银含量
	private String tasteS;// 硫品位
	private String conS;// 硫含量
	private String jinzhaAu;// 金浸渣
	private String jinzhaAg;// 银浸渣
	private String haoyao;// 耗药
	private String cu;// 铜
	private String pb;// 铅
	private String zn;// 锌
	private String arsenic;// 砷
	private String sb;// 锑
	private String isTouliao;// 1已投料0未投料
	private Long mvId;// mis中车次表的id
	// public StockDetail(){
	// wetMine = "0";
	// darkMine = "0";
	// tasteAu = "0";
	// conAu = "0";
	// tasteAg = "0";
	// conAg = "0";
	// tasteS = "0";
	// conS = "0";
	// jinzhaAu = "0";
	// jinzhaAg = "0";
	// haoyao = "0";
	// cu = "0";
	// pb = "0";
	// zn = "0";
	// arsenic = "0";
	// sb = "0";
	// }
	private String aresName;// 区域名称
	private String mine;// 矿类
	private String meterDate_Str;// 过磅日期
	private String isPinwei;// 判断是否有品位
	private String aresId;// 料场id

	public String getAresId() {
		return aresId;
	}

	public void setAresId(String aresId) {
		this.aresId = aresId;
	}

	public String getIsPinwei() {
		return isPinwei;
	}

	public void setIsPinwei(String isPinwei) {
		this.isPinwei = isPinwei;
	}

	public Long getMvId() {
		return mvId;
	}

	public void setMvId(Long mvId) {
		this.mvId = mvId;
	}

	public String getAresName() {
		return aresName;
	}

	public void setAresName(String aresName) {
		this.aresName = aresName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMine() {
		return mine;
	}

	public void setMine(String mine) {
		this.mine = mine;
	}

	public String getMeterDate_Str() {
		return meterDate_Str;
	}

	public void setMeterDate_Str(String meterDate_Str) {
		this.meterDate_Str = meterDate_Str;
	}

	public Long getId() {
		return id;
	}

	public Long getStockId() {
		return stockId;
	}

	public String getCbId() {
		return cbId;
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

	public String getIsTouliao() {
		return isTouliao;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setStockId(Long stockId) {
		this.stockId = stockId;
	}

	public void setCbId(String cbId) {
		this.cbId = cbId;
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

	public void setIsTouliao(String isTouliao) {
		this.isTouliao = isTouliao;
	}

}
