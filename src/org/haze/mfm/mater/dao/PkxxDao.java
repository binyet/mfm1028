package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Pkxx;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：PkxxDao 
 * 程序说明：配矿信息
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月17日 上午11:13:19
 * @author 王亚茹
 */
@Repository
public class PkxxDao extends AbsDao<Pkxx>{

	@Override
	public Class<Pkxx> getEntityClass() {
		// TODO Auto-generated method stub
		return Pkxx.class;
	}

}
