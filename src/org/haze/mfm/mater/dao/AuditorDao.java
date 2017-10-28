package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Auditor;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：
 * 程序说明：
 * 版权信息:
 * 时间：2017年10月28日 下午7:50:02
 * @author 
 */
@Repository
public class AuditorDao extends AbsDao<Auditor> {

	@Override
	public Class<Auditor> getEntityClass() {
		// TODO Auto-generated method stub
		return Auditor.class;
	}

}
