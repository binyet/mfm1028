package org.haze.mfm.mater.service;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.mfm.mater.dao.DeptDao;
import org.haze.mfm.mater.model.Dept;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：DeptService 
 * 程序说明：投料单位的维护
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年6月8日 下午2:26:48
 * @author 王亚茹
 */
@Service
public class DeptService extends AbsService<Dept>{

	@Resource
	private DeptDao deptDao;

	@Override
	protected AbsDao<Dept> getEntityDao() {
		// TODO Auto-generated method stub
		return deptDao;
	}
}
