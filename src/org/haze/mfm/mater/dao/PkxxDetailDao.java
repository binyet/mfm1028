package org.haze.mfm.mater.dao;

import org.haze.base.dao.AbsDao;
import org.haze.mfm.mater.model.PkxxDetail;
import org.springframework.stereotype.Repository;

/**
 * 
 * 程序名称：PkxxDetailDao 
 * 程序说明：配矿详细
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月17日 上午11:24:39
 * @author 王亚茹
 */
@Repository
public class PkxxDetailDao extends AbsDao<PkxxDetail>{

	@Override
	public Class<PkxxDetail> getEntityClass() {
		// TODO Auto-generated method stub
		return PkxxDetail.class;
	}

}
