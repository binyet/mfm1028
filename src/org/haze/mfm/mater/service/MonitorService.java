package org.haze.mfm.mater.service;


import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.MonitorDao;
import org.haze.mfm.mater.dao.WeighDao;
import org.haze.mfm.mater.model.Monitor;
import org.haze.mfm.mater.model.Weigh;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：MonitorService 
 * 程序说明：监磅称重的维护
 * 版权信息:山东金软科技股份有限公司
 * 时间：2017年10月16日 下午2:26:48
 * @author 鲁彬
 */
@Service
public class MonitorService extends AbsService<Monitor>{

	@Resource
	private MonitorDao monitorDao;

	@Override
	protected AbsDao<Monitor> getEntityDao() {
		// TODO Auto-generated method stub
		
		return monitorDao;
	}
}
