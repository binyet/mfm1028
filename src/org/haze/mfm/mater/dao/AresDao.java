package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Ares;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：AresDao 
 * 程序说明：区域管理
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月16日 下午4:19:03
 * @author 王亚茹
 */
@Repository
public class AresDao extends AbsDao<Ares>{

	@Override
	public Class<Ares> getEntityClass() {
		// TODO Auto-generated method stub
		return Ares.class;
	}

}
