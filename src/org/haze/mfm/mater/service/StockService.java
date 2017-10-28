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
import org.haze.mfm.mater.dao.StockDao;
import org.haze.mfm.mater.dao.StockDetailDao;
import org.haze.mfm.mater.model.Stock;
import org.haze.mfm.mater.model.StockDetail;
import org.haze.mfm.util.HttpURLConnectionUtil;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：StockService 
 * 程序说明：库存管理
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月16日 下午5:14:31
 * @author 王亚茹
 */
@Service
public class StockService extends AbsService<Stock>{
	public static String A;
	@Resource
	private StockDao stockDao;
	@Resource
	private StockDetailDao stockDetailDao;
	@Override
	protected AbsDao<Stock> getEntityDao() {
		// TODO Auto-generated method stub
		return stockDao;
	}

	/**
	 * 保存车次分区   入库记录
	 * StockService
	 * @param stock
	 * @throws Exception
	 */
	public boolean saveCheciFenqu(Stock stock) throws Exception{
		boolean flag = false;
		try {
			stock.setId(UniqueIdUtil.genId());//插入新id
			stock.setStockDate(DateUtil.getString(new Date(), "yyyy-MM-dd HH:mm:ss"));//入库时间是当前时间
			stock.setPerson(String.valueOf(ContextUtil.getCurrentUserId()));//操作人是当前登录人
			String checiJson = stock.getCheciJson();
			List<StockDetail> stockDetailList = JsonUtil.fromJson(checiJson,List.class,StockDetail.class);//将车次 信息转化为list
			//把车次加入到字表里去
			for (StockDetail stockDetail : stockDetailList) {
				Long mvId = stockDetail.getId();//mis里边的车次id
				//查询详细信息的条件
				Map<String, String> map = new HashMap<String, String>();
				map.put("meterDate_Str", stockDetail.getMeterDate_Str());
				map.put("cbId", stockDetail.getCbId());
				map.put("checi", stockDetail.getCheci());
				map.put("mine", stockDetail.getMine());
				//调用其他项目的方法
				A = HttpURLConnectionUtil.httpURLConnectionPOST("MapController/InterfaceCheciGetNotCallback.haze", map);
				StockDetail stockDetail1 = JsonUtil.fromJson(A,StockDetail.class);//将得到的json转化成对象
				stockDetail1.setId(UniqueIdUtil.genId());//插入新id
				stockDetail1.setStockId(stock.getId());//主表id
				stockDetail1.setIsTouliao("0");//未投料
				stockDetail1.setMvId(mvId);//mis中车次表id
				stockDetail1.setMeterDate_Str(stockDetail.getMeterDate_Str());//过磅日期
				stockDetail1.setMine( stockDetail.getMine());//矿类
				stockDetailDao.insert(stockDetail1);//增加子表信息
				//车次ID
				Map<String, String> map1 = new HashMap<String, String>();
				map1.put("id", String.valueOf(mvId));
				HttpURLConnectionUtil.httpURLConnectionPOST("MapController/InterfaceUpdateIsFenqu.haze", map1);//修改车次为已分区
			}
			insert(stock);//添加主表信息
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	/**
	 * 删除
	 * @throws Exception 
	 */
	public void del(Stock stock) throws Exception{
		String ids = stock.getIds();//主表要删除的ids
		delById(stock.getIds());//删除主表信息
		Long[] key = RequestUtil.getLongAryByStr(ids);
		//删除后将mis中的车次改为未分区
		for (int i = 0; i < key.length; i++) {
			Long stockId = key[i];//主表id
			StockDetail stockDetail = new StockDetail();
			stockDetail.setStockId(stockId);
			List<StockDetail> stockDetailList = stockDetailDao.select("select", stockDetail);//将子表信息查出来
			if(null != stockDetailList && stockDetailList.size()>0){
				for (StockDetail stockDetail2 : stockDetailList) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("id", String.valueOf(stockDetail2.getMvId()));
					HttpURLConnectionUtil.httpURLConnectionPOST("MapController/InterfaceUpdateIsNotFenqu.haze", map);//修改车次为未分区
				}
			}
		}
		stockDetailDao.delete("delBystockId", key);//删除子表信息
	}
	
}
