package org.haze.mfm.mater.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.AresDao;
import org.haze.mfm.mater.dao.StockDao;
import org.haze.mfm.mater.model.Ares;
import org.haze.mfm.mater.model.Stock;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：AresService 
 * 程序说明：区域管理 
 * 版权信息:山东金软科技股份有限公司 
 * 时间：2016年5月16日 下午4:19:45
 * 
 * @author 王亚茹
 */
@Service
public class AresService extends AbsService<Ares> {

	@Resource
	private AresDao aresDao;
	@Resource
	private StockDao stockDao;// 库存dao

	@Override
	protected AbsDao<Ares> getEntityDao() {
		// TODO Auto-generated method stub
		return aresDao;
	}


	/**
	 * 删除区域 判断该区域是否已经存放原料
	 * 
	 * @param ids
	 * @throws Exception
	 */
	public Map<String, Object> del(String ids) throws Exception {
		Map<String, Object> retMap = new HashMap<String, Object>();
		List<String> retList = new ArrayList<String>();
		String[] idArr = ids.split(",");
		for (int i = 0; i < idArr.length; i++) {
			Stock stock = new Stock();
			stock.setAresId(Long.valueOf(idArr[i]));
			List<Stock> stockList = stockDao.select("select", stock);// 查看该存放区是否已经存放原料
			if (null != stockList && stockList.size() > 0 && !stockList.isEmpty()) {// 如果已经存放原料
				String aresName = selectOne(Long.valueOf(idArr[i])).getAresName();
				retList.add(aresName);
			}
		}
		if (!retList.isEmpty() || retList.size() > 0) {// 如果要删除的数据里包括已经存放原料的区域
			retMap.put("flag", false);
			retMap.put("retList", retList);
		} else {
			delById(ids);
			retMap.put("flag", true);
		}
		return retMap;
	}
}
