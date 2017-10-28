package org.haze.mfm.mater.dao;


import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Driver;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：DriverDao
 * 程序说明：司机管理
 * 版权信息:
 * 时间：2017年10月14日 下午3:03:47
 * @author 鲁彬
 */
@Repository
public class DriverDao extends AbsDao<Driver>{

	@Override
	public Class<Driver> getEntityClass() {
		// TODO Auto-generated method stub
		return Driver.class;
	}



}
