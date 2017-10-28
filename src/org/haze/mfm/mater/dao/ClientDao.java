package org.haze.mfm.mater.dao;


import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.Client;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：ClientDao
 * 程序说明：客户管理
 * 版权信息:
 * 时间：2017年10月14日 下午3:03:47
 * @author 鲁彬
 */
@Repository
public class ClientDao extends AbsDao<Client>{

	@Override
	public Class<Client> getEntityClass() {
		// TODO Auto-generated method stub
		return Client.class;
	}



}
