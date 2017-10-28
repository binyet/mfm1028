package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Dept;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：DeptDao 
 * 程序说明：投料单位维护
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年6月8日 下午2:23:35
 * @author 王亚茹
 */
@Repository
public class DeptDao extends AbsDao<Dept>{

	@Override
	public Class<Dept> getEntityClass() {
		// TODO Auto-generated method stub
		return Dept.class;
	}

}
