package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.StockDetail;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：StockDetailDao 
 * 程序说明：库存管理
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月16日 下午5:37:07
 * @author 王亚茹
 */
@Repository
public class StockDetailDao extends AbsDao<StockDetail>{

	@Override
	public Class<StockDetail> getEntityClass() {
		// TODO Auto-generated method stub
		return StockDetail.class;
	}

}
