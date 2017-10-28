package org.haze.mfm.mater.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.base.web.util.RequestUtil;
import org.haze.mfm.mater.dao.StockDetailDao;
import org.haze.mfm.mater.model.StockDetail;
import org.haze.mfm.util.HttpURLConnectionUtil;
import org.springframework.stereotype.Service;
/**
 * 
 * 程序名称：StockDetailService 
 * 程序说明：库存管理
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月16日 下午5:38:27
 * @author 王亚茹
 */
@Service
public class StockDetailService extends AbsService<StockDetail>{
	@Resource
	private StockDetailDao stockDetailDao;
	@Resource
	private StockService stockService;
	@Override
	protected AbsDao<StockDetail> getEntityDao() {
		// TODO Auto-generated method stub
		return stockDetailDao;
	}
	
	/**
	 * 删除子表信息
	 * @param ids
	 * @param stockId
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> delStockDetail(StockDetail stockDetail) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		Long[] key = RequestUtil.getLongAryByStr(stockDetail.getIds());
		for (int s = 0; s < key.length; s++) {
			Long id = key[s];//获取要删除的子表ID
			StockDetail stockDetail2 = selectOne(id);
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("id", String.valueOf(stockDetail2.getMvId()));
			HttpURLConnectionUtil.httpURLConnectionPOST("MapController/InterfaceUpdateIsNotFenqu.haze", map1);//修改车次为未分区
		}
		delById(stockDetail.getIds());//删除子表信息
		List<StockDetail> list = select(stockDetail);//根据主表id查询子表信息
		if(null != list && list.size()>0){//该入库记录还有车次
			map.put("total", list.size());
		}else{//如果该次入库所有车次已经被删除 则删除该次入库记录
			stockService.delById(String.valueOf(stockDetail.getStockId()));
			map.put("total", "0");
		}
		return map;
	}
	
	/**
	 * 将车次改为未投料
	 * @param id
	 * @throws Exception
	 */
	public void updateNotTouliao(Long id) throws Exception{
		StockDetail stockDetail = new StockDetail();
		stockDetail.setId(id);
		stockDetailDao.update("updateNotTouliao", stockDetail);
	}
	
	/**
	 * 补充品位信息
	 * @param mvId
	 * @throws Exception
	 */
	public void updateTaste(StockDetail stockDetail) throws Exception{
		stockDetailDao.update("updateTaste", stockDetail);
	}
	
	/**
	 * 根据区域查询一段时间每一个区域的入库量
	 * @param beginDate
	 * @param endDate
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDarkMine(String beginDate,String endDate) throws Exception{
		Map<String, Object> mapParmar = new HashMap<String, Object>();
		mapParmar.put("beginDate", beginDate);
		mapParmar.put("endDate", endDate);
		return stockDetailDao.selectObject("selectDarkMine", mapParmar);
	}
	
	/**
	 * 查询每一个区域的 配矿量
	 * @param beginDate
	 * @param endDate
	 * @param aresId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPkmine(String beginDate,String endDate,String aresId) throws Exception{
		Map<String, Object> mapParmar = new HashMap<String, Object>();
		mapParmar.put("aresId", aresId);
		mapParmar.put("beginDate", beginDate);
		mapParmar.put("endDate", endDate);
		return (Map<String, Object>) stockDetailDao.selectOneObject("selectPkmine", mapParmar);
	}
}
