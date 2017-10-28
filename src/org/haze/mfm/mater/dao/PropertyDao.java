package org.haze.mfm.mater.dao;


import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Property;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：PropertyDao
 * 程序说明：性质管理
 * 版权信息:
 * 时间：2017年10月14日 下午3:03:47
 * @author 鲁彬
 */
@Repository
public class PropertyDao extends AbsDao<Property>{

	@Override
	public Class<Property> getEntityClass() {
		// TODO Auto-generated method stub
		return Property.class;
	}



}
