package org.haze.mfm.mater.service;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.AuditorDao;
import org.haze.mfm.mater.model.Auditor;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：AuditorService
 * 程序说明：监磅人管理
 * 版权信息:
 * 时间：2017年10月28日 下午7:51:33
 * @author 鲁彬
 */
@Service
public class AuditorService extends AbsService<Auditor> {

	@Resource
	private AuditorDao auditorDao;
	
	@Override
	protected AbsDao<Auditor> getEntityDao() {
		// TODO Auto-generated method stub
		return auditorDao;
	}

}
