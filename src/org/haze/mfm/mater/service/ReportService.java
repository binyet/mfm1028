package org.haze.mfm.mater.service;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.ReportDao;
import org.haze.mfm.mater.model.Report;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：ReportService
 * 程序说明：化验结果
 * 版权信息:
 * 时间：2017年10月26日 上午8:26:08
 * @author 鲁彬
 */
@Service
public class ReportService extends AbsService<Report>{

	@Resource
	private ReportDao reportDao;

	@Override
	protected AbsDao<Report> getEntityDao() {
		// TODO Auto-generated method stub
		
		return reportDao;
	}

}
