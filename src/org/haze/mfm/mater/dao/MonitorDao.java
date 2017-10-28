package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Monitor;
import org.haze.mfm.mater.model.Weigh;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：
 * 程序说明：
 * 版权信息:
 * 时间：2017年10月13日 下午6:30:30
 * @author 
 */
@Repository
public class MonitorDao extends AbsDao<Monitor>{

	@Override
	public Class<Monitor> getEntityClass() {
		// TODO Auto-generated method stub
		return Monitor.class;
	}

}
