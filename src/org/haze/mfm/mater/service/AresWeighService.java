package org.haze.mfm.mater.service;


import java.util.List;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.base.util.JsonUtil;
import org.haze.mfm.mater.dao.AresWeighDao;
import org.haze.mfm.mater.model.AresWeigh;
import org.haze.mfm.mater.model.StockDetail;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：HuayanService
 * 程序说明：化验结果管理
 * 版权信息:
 * 时间：2017年10月20日 上午11:53:16
 * @author 鲁彬
 */
@Service
public class AresWeighService extends AbsService<AresWeigh>{
	@Resource
	private AresWeighDao aresWeighDao;
	

	@Override
	protected AbsDao<AresWeigh> getEntityDao() {
		// TODO Auto-generated method stub
		return aresWeighDao;
	}

}
