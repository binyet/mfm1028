package org.haze.mfm.mater.service;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.SourceDao;
import org.haze.mfm.mater.model.Source;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：SourceService
 * 程序说明：来源
 * 版权信息:
 * 时间：2017年10月14日 下午3:02:51
 * @author 鲁彬
 */
@Service
public class SourceService extends AbsService<Source>{

	@Resource
	private SourceDao sourceDao;

	@Override
	protected AbsDao<Source> getEntityDao() {
		// TODO Auto-generated method stub
		return sourceDao;
	}
	
	
}
