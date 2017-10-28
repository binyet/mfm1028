package org.haze.mfm.mater.service;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.CheciHBDao;
import org.haze.mfm.mater.model.CheciHB;
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
public class CheciHBService extends AbsService<CheciHB>{
	@Resource
	private CheciHBDao checiHBDao;
	

	@Override
	protected AbsDao<CheciHB> getEntityDao() {
		// TODO Auto-generated method stub
		return checiHBDao;
	}


}
