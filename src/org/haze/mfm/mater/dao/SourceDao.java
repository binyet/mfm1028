package org.haze.mfm.mater.dao;


import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Source;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：SourceDao
 * 程序说明：来源管理
 * 版权信息:
 * 时间：2017年10月14日 下午3:03:47
 * @author 鲁彬
 */
@Repository
public class SourceDao extends AbsDao<Source>{

	@Override
	public Class<Source> getEntityClass() {
		// TODO Auto-generated method stub
		return Source.class;
	}



}
