package org.haze.mfm.mater.dao;


import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Weigher;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：WeigherDao
 * 程序说明：过磅人管理
 * 版权信息:
 * 时间：2017年10月14日 下午3:03:47
 * @author 鲁彬
 */
@Repository
public class WeigherDao extends AbsDao<Weigher>{

	@Override
	public Class<Weigher> getEntityClass() {
		// TODO Auto-generated method stub
		return Weigher.class;
	}



}
