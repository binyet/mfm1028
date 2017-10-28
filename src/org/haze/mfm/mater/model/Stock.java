package org.haze.mfm.mater.model;

import java.util.Date;

import org.haze.base.model.BaseModel;
import org.haze.base.util.DateUtil;
import org.haze.base.util.EnumUtil;

/**
 * 
 * 程序名称：Stock 程序说明：库存管理 车次分区 版权信息:山东金软科技股份有限公司 时间：2016年5月16日 下午1:54:13
 * 
 * @author 王亚茹
 */
public class Stock extends BaseModel {
	private static final long serialVersionUID = 1L;
	private Long id;// 主键
	private Long aresId;// 区域id
	private String xingzhi;// 性质 金精矿 银精矿
	private String stockDate;// 入库时间
	private String person;// 操作人
	private String remark;// 备注
	private String checiJson;// 所选车次json

	// 2016-05-31 加
	private String xingzhi_str;// 性质字典值
	private String aresName;// 区域名称
	private String fullName;// 操作人名称
	private int tlCount;// 该次入库的投料车次数

	public Stock() {
		stockDate = DateUtil.getString(new Date(), "yyyy-MM-dd");
	}

	public int getTlCount() {
		return tlCount;
	}

	public void setTlCount(int tlCount) {
		this.tlCount = tlCount;
	}

	public String getXingzhi_str() {
		if (null != getXingzhi() && !getXingzhi().equals("")) {
			StringBuffer sb = new StringBuffer();
			String[] strArr = getXingzhi().split(",");
			for (int i = 0; i < strArr.length; i++) {
				sb.append(EnumUtil.getPlatString(strArr[i]));
				if (i < strArr.length) {
					sb.append(",");
				}
			}
			xingzhi_str = sb.toString().substring(0, sb.length() - 1);
		}
		return xingzhi_str;
	}

	public String getAresName() {
		return aresName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setXingzhi_str(String xingzhi_str) {
		this.xingzhi_str = xingzhi_str;
	}

	public void setAresName(String aresName) {
		this.aresName = aresName;
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

	public Long getId() {
		return id;
	}

	public Long getAresId() {
		return aresId;
	}

	public String getXingzhi() {
		return xingzhi;
	}

	public String getStockDate() {
		return stockDate;
	}

	public String getPerson() {
		return person;
	}

	public String getRemark() {
		return remark;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setAresId(Long aresId) {
		this.aresId = aresId;
	}

	public void setXingzhi(String xingzhi) {
		this.xingzhi = xingzhi;
	}

	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
