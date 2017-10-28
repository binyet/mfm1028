package org.haze.mfm.mater.service;


import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.WeigherDao;
import org.haze.mfm.mater.model.Weigher;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：WeigherService
 * 程序说明：过磅人
 * 版权信息:山东金软科技股份有限公司
 * 时间：2017年10月16日 上午10:26:48
 * @author 鲁彬
 */
@Service
public class WeigherService extends AbsService<Weigher>{

	@Resource
	private WeigherDao weigherDao;

	@Override
	protected AbsDao<Weigher> getEntityDao() {
		// TODO Auto-generated method stub
		return weigherDao;
	}
}
