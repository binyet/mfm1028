package org.haze.mfm.mater.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.base.web.util.RequestUtil;
import org.haze.mfm.mater.dao.PkxxDetailDao;
import org.haze.mfm.mater.model.Pkxx;
import org.haze.mfm.mater.model.PkxxDetail;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：PkxxDetailService 
 * 程序说明：配矿详细
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月17日 上午11:26:12
 * @author 王亚茹
 */
@Service
public class PkxxDetailService extends AbsService<PkxxDetail>{

	@Resource
	private PkxxDetailDao pkxxDetailDao;
	@Resource
	private PkxxService pkxxService;
	@Resource
	private StockDetailService stockDetailService;
	@Override
	protected AbsDao<PkxxDetail> getEntityDao() {
		// TODO Auto-generated method stub
		return pkxxDetailDao;
	}
	
	/**
	 * 删除配矿详细 子表信息
	 * @param ids
	 * @param pkxxId
	 * @return
	 */
	public Map<String, Object> delPkxxDetail(PkxxDetail pkxxDetail) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<PkxxDetail> list = select(pkxxDetail);//根据主表Id查询子表信息
		if(null != list && list.size()>0){//如果该配矿信息里还有车次  改变主表信息
			Pkxx pkxx = new Pkxx();
			pkxx.setUpd("updsc");
			pkxx.setId(pkxxDetail.getPkxxId());
			//湿矿
			if(null != pkxxDetail.getWetMine() && !pkxxDetail.getWetMine().equals("")){
				pkxx.setPkWetMine(pkxxDetail.getWetMine());
			}else{
				pkxx.setPkWetMine("0");
			}
			//干矿
			if(null != pkxxDetail.getDarkMine() && !pkxxDetail.getDarkMine().equals("")){
				pkxx.setPxDarkMine(pkxxDetail.getDarkMine());
			}else{
				pkxx.setPxDarkMine("0");
			}
			//金品位
			if(null != pkxxDetail.getTasteAu() && !pkxxDetail.getTasteAu().equals("")){
				pkxx.setPkTasteAu(pkxxDetail.getTasteAu());
			}else{
				pkxx.setPkTasteAu("0");
			}
			//金含量
			if(null != pkxxDetail.getConAu() && !pkxxDetail.getConAu().equals("")){
				pkxx.setPkConAu(pkxxDetail.getConAu());
			}else{
				pkxx.setPkConAu("0");
			}
			//银品位
			if(null != pkxxDetail.getTasteAg() && !pkxxDetail.getTasteAg().equals("")){
				pkxx.setPkTasteAg(pkxxDetail.getTasteAg());
			}else{
				pkxx.setPkTasteAg("0");
			}
			//银含量
			if(null != pkxxDetail.getConAg() && !pkxxDetail.getConAg().equals("")){
				pkxx.setPkConAg(pkxxDetail.getConAg());
			}else{
				pkxx.setPkConAg("0");
			}
			//硫含量
			if(null != pkxxDetail.getConS() && !pkxxDetail.getConS().equals("")){
				pkxx.setPkConS(pkxxDetail.getConS());
			}else{
				pkxx.setPkConS("0");
			}
			//铜含量
			if(null != pkxxDetail.getCu() && !pkxxDetail.getCu().equals("")){
				pkxx.setPkConCu(pkxxDetail.getCu());
			}else{
				pkxx.setPkConCu("0");
			}
			//铅含量
			if(null != pkxxDetail.getPb() && !pkxxDetail.getPb().equals("")){
				pkxx.setPkConPb(pkxxDetail.getPb());
			}else{
				pkxx.setPkConPb("0");
			}
			//锌含量
			if(null != pkxxDetail.getZn() && !pkxxDetail.getZn().equals("")){
				pkxx.setPkConZn(pkxxDetail.getZn());
			}else{
				pkxx.setPkConZn("0");
			}
			//砷含量
			if(null != pkxxDetail.getArsenic() && !pkxxDetail.getArsenic().equals("")){
				pkxx.setPkConAs(pkxxDetail.getArsenic());
			}else{
				pkxx.setPkConAs("0");
			}
			//锑含量
			if(null != pkxxDetail.getSb() && !pkxxDetail.getSb().equals("")){
				pkxx.setPkConSb(pkxxDetail.getSb());
			}else{
				pkxx.setPkConSb("0");
			}
			//金浸渣含量
			if(null != pkxxDetail.getJinzhaAu() && !pkxxDetail.getJinzhaAu().equals("")){
				pkxx.setPkJinzhaAu(pkxxDetail.getJinzhaAu());
			}else{
				pkxx.setPkJinzhaAu("0");
			}
			//银浸渣含量
			if(null != pkxxDetail.getJinzhaAg() && !pkxxDetail.getJinzhaAg().equals("")){
				pkxx.setPkJinzhaAg(pkxxDetail.getJinzhaAg());
			}else{
				pkxx.setPkJinzhaAg("0");
			}
			//耗药
			if(null != pkxxDetail.getHaoyao() && !pkxxDetail.getHaoyao().equals("")){
				pkxx.setPkHaoyao(pkxxDetail.getHaoyao());
			}else{
				pkxx.setPkHaoyao("0");
			}
			pkxxService.update(pkxx);
			Long[] key = RequestUtil.getLongAryByStr(pkxxDetail.getIds());
			for (int i = 0; i < key.length; i++) {
				Long id = key[i];
				PkxxDetail pkxxDetail2 = selectOne(id);
				Long stockDetailId = pkxxDetail2.getStockDetailId();
				stockDetailService.updateNotTouliao(stockDetailId);//将车次改为未投料
			}
			delById(pkxxDetail.getIds());//删除子表指信息
			map.put("total", list.size());
		}else{//如果该配矿信息里已经没有车次 删除主表信息
			pkxxService.delById(String.valueOf(pkxxDetail.getPkxxId()));
			map.put("total", "0");
		}
		return map;
	}
}
