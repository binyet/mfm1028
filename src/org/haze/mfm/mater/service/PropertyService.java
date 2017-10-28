package org.haze.mfm.mater.service;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.PropertyDao;
import org.haze.mfm.mater.model.Property;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：PropertyService
 * 程序说明：性质
 * 版权信息:
 * 时间：2017年10月14日 下午3:02:51
 * @author 
 */
@Service
public class PropertyService extends AbsService<Property>{

	@Resource
	private PropertyDao propertyDao;

	@Override
	protected AbsDao<Property> getEntityDao() {
		// TODO Auto-generated method stub
		return propertyDao;
	}
	
	
}
