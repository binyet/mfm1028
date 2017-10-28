package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.CheciHB;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：HuayanDao
 * 程序说明：化验结果
 * 版权信息:
 * 时间：2017年10月20日 上午11:52:16
 * @author 鲁彬
 */
@Repository
public class CheciHBDao extends AbsDao<CheciHB>{

	@Override
	public Class<CheciHB> getEntityClass() {
		// TODO Auto-generated method stub
		return CheciHB.class;
	}

}
