package org.haze.mfm.mater.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.base.util.ContextUtil;
import org.haze.base.util.DateUtil;
import org.haze.base.util.JsonUtil;
import org.haze.base.util.UniqueIdUtil;
import org.haze.base.web.util.RequestUtil;
import org.haze.mfm.mater.dao.PkxxDao;
import org.haze.mfm.mater.dao.PkxxDetailDao;
import org.haze.mfm.mater.model.Pkxx;
import org.haze.mfm.mater.model.PkxxDetail;
import org.haze.mfm.mater.model.StockDetail;
import org.haze.mfm.util.HttpURLConnectionUtil;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：PkxxService 
 * 程序说明：配矿信息
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月17日 上午11:15:00
 * @author 王亚茹
 */

@Service
public class PkxxService extends AbsService<Pkxx>{
	public static String A;
	@Resource
	private PkxxDao pkxxDao;
	@Resource
	private StockDetailService stockDetailService;
	@Resource
	private DeptService deptService;
	@Resource
	private PkxxDetailDao pkxxDetailDao;
	@Override
	protected AbsDao<Pkxx> getEntityDao() {
		// TODO Auto-generated method stub
		return pkxxDao;
	}
	
	/**
	 * 保存配矿信息
	 * @param pkxx
	 */
	public void savePkxx(Pkxx pkxx) throws Exception{
		pkxx.setId(UniqueIdUtil.genId());//增加新Id
		pkxx.setPkDate(DateUtil.getString(new Date(), "yyyy-MM-dd HH:mm:ss"));//配矿时间是当前时间
		pkxx.setPkPerson(String.valueOf(ContextUtil.getCurrentUserId()));//配矿人是当前登录人
		Long orgId = deptService.selectOne(Long.valueOf(pkxx.getTouliaoDept())).getOrgId();//查询投料单位的组织ID
		pkxx.setOrgId(orgId);
		insert(pkxx);//增加配矿主表信息
		String checiJson = pkxx.getCheciJson();//获取车次信息
		List<StockDetail> stockDetailList = JsonUtil.fromJson(checiJson,List.class,StockDetail.class);//将车次 信息转化为list
		for (StockDetail stockDetail : stockDetailList) {//循环车次信息
			PkxxDetail pkxxDetail = new PkxxDetail();
			pkxxDetail.setId(UniqueIdUtil.genId());//为子表增加新id
			pkxxDetail.setPkxxId(pkxx.getId());//主表Id
			pkxxDetail.setStockDetailId(stockDetail.getId());//车次id
			pkxxDetailDao.insert(pkxxDetail);//增加子表信息
			stockDetailService.update(stockDetail);//将车次信息修改为已投料
		}
	}
	
	
	/**
	 * 删除主表信息 删除配矿
	 * @param pkxx
	 * @throws Exception 
	 */
	public void del(Pkxx pkxx) throws Exception{
		String ids = pkxx.getIds();
		Long[] key = RequestUtil.getLongAryByStr(ids);
		for (int i = 0; i < key.length; i++) {
			Long pkxxId = key[i];//主表Id
			List<PkxxDetail> pkxxDetailList = pkxxDetailDao.select("select", pkxxId);//根据主表查询子表信息
			if(null != pkxxDetailList && pkxxDetailList.size()>0){
				for (PkxxDetail pkxxDetail : pkxxDetailList) {
					Long stockDetailId = pkxxDetail.getStockDetailId();//得到车次详细表的id
					stockDetailService.updateNotTouliao(stockDetailId);//将车次改为未投料
				}
			}
		}
		pkxxDetailDao.delete("delBypkxxId", key);//删除子表信息
		delById(ids);//删除主表信息
	}
	
	/**
	 * 在数据录入时 往车次详细里补充品位信息  没有品位的不可配矿
	 * @throws Exception 
	 */
	public StockDetail saveStockDetail(StockDetail stockDetailPar ) throws Exception{
		StockDetail stockDetail = new StockDetail();
		stockDetail.setIsTouliao("0");
		List<StockDetail> stockDetailList = stockDetailService.select(stockDetail);//将所有未投料的车次查询出来
		if(null != stockDetailList && stockDetailList.size()>0){
			for (StockDetail stockDetail2 : stockDetailList) {
				//查询详细信息的条件
				Map<String, String> map = new HashMap<String, String>();
				map.put("meterDate_Str", stockDetail2.getMeterDate_Str());
				map.put("cbId", stockDetail2.getCbId());
				map.put("checi", stockDetail2.getCheci());
				map.put("mine", stockDetail2.getMine());
				A = HttpURLConnectionUtil.httpURLConnectionPOST("MapController/InterfaceCheciGetNotCallback.haze", map);
				StockDetail stockDetail1 = JsonUtil.fromJson(A,StockDetail.class);//将得到的json转化成对象  该对象里包括品位信息
				stockDetail1.setId(stockDetail2.getId());
				stockDetailService.updateTaste(stockDetail1);
			}
		}
				return null;
	}
}
