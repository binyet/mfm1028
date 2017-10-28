package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Report;
import org.haze.mfm.mater.model.Weigh;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：ReportDao
 * 程序说明：化验结果
 * 版权信息:
 * 时间：2017年10月26日 上午8:24:12
 * @author 
 */
@Repository
public class ReportDao extends AbsDao<Report>{

	@Override
	public Class<Report> getEntityClass() {
		// TODO Auto-generated method stub
		return Report.class;
	}

}
