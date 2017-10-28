package org.haze.mfm.mater.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.haze.mfm.mater.model.Pkxx;
import org.haze.mfm.mater.model.PkxxDetail;
import org.haze.mfm.mater.model.StockDetail;
import org.haze.mfm.mater.service.DeptService;
import org.haze.mfm.mater.service.PkxxDetailService;
import org.haze.mfm.mater.service.PkxxService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：PkxxController 
 * 程序说明：配矿信息
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年6月2日 下午3:00:15
 * @author 王亚茹
 */
@RequestMapping("/Pkxx/")
@Controller
public class PkxxController {
	
	public final static String PKXX_ADD ="gresource/mfm/mater/pkxx/pkxxAdd.jsp";//数据录入页面
	public final static String PKXX_LIST ="gresource/mfm/mater/pkxx/pkxxList.jsp";//配矿记录页面
	public final static String PKXX_EDIT ="gresource/mfm/mater/pkxx/pkxxEdit.jsp";//修改配矿记录
	public final static String PKXX_GKTJ ="gresource/mfm/mater/pkxx/pkxxGktj.jsp";//给矿统计页面
	
	@Resource
	private PkxxService pkxxService;
	@Resource
	private PkxxDetailService pkxxDetailService;
	@Resource
	private DeptService deptService;
	/**
	 * 跳入数据录入界面
	 * @param pkxx
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("pkxxAdd")
	public ModelAndView pkxxAdd(Pkxx pkxx,ModelMap modelMap,String isAdd) throws Exception{
//		pkxxService.saveStockDetail();//补充品位信息
		if(null != isAdd && !isAdd.equals("")){
			modelMap.put("isAdd", isAdd);//1表示从配矿记录页面跳过去
		}else{
			modelMap.put("isAdd", "0");//1表示从配矿记录页面跳过去
		}
		return new ModelAndView(PkxxController.PKXX_ADD,modelMap);
	}
	
	/**
	 * 补充车次详细里边的品位信息
	 * @param stockDetail
	 * @throws Exception
	 */
	@RequestMapping("saveTaste")
	@ResponseBody
	public StockDetail saveTaste(StockDetail stockDetail) throws Exception{
		return pkxxService.saveStockDetail(stockDetail);//补充品位信息
	}

	/**
	 * 保存配矿信息
	 * @param pkxx
	 * @param modelMap
	 * @throws Exception 
	 */
	@RequestMapping("savePkxx")
	@ResponseBody
	public void savePkxx(Pkxx pkxx,ModelMap modelMap) throws Exception{
		pkxxService.savePkxx(pkxx);
	}
	
	/**
	 * 配矿记录列表页面
	 * @param pkxx
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("pkxxList")
	public ModelAndView pkxxList(Pkxx pkxx,ModelMap modelMap){
		return new ModelAndView(PkxxController.PKXX_LIST,modelMap);
	}
	
	/**
	 * 配矿记录的列表数据
	 * @param pkxx
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getPkxxList")
	@ResponseBody
	public Object getPkxxList(Pkxx pkxx) throws Exception{
		return pkxxService.easyUIJson(pkxx, pkxx.getPageBean());
	}
	
	/* 配矿记录的列表数据  用于给矿统计
	 * @param pkxx
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getPkxxListUseGktj")
	@ResponseBody
	public Object getPkxxListUseGktj(Pkxx pkxx) throws Exception{
		return pkxxService.select(pkxx);
	}
	/**
	 * 获取配矿的详细信息
	 * @param pkxxDetail
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getPkxxDetailList")
	@ResponseBody
	public Object getPkxxDetailList(PkxxDetail pkxxDetail) throws Exception{
		return pkxxDetailService.easyUIJson(pkxxDetail);
	}
	
	/**
	 * 修改配矿记录
	 * @param pkxx
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("pkxxEdit")
	public ModelAndView pkxxEdit(Pkxx pkxx,ModelMap modelMap) throws Exception{
		Pkxx pkxx1 = pkxxService.selectOne(pkxx.getId());//将本条信息的基本信息查出来
		modelMap.put("pkxx", pkxx1);
		modelMap.put("deptList", deptService.select(null));//所有的投料单位
		return new ModelAndView(PkxxController.PKXX_EDIT,modelMap);
	}
	
	/**
	 * 保存配矿信息修改
	 * @param pkxx
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("saveEdit")
	public ModelAndView saveEdit(Pkxx pkxx,ModelMap modelMap) throws Exception{
		pkxx.setUpd("updjb");//修改基本信息
		pkxxService.update(pkxx);//修改配矿记录
		modelMap.put("message", "修改成功!!!");
		return pkxxEdit(pkxx, modelMap);
	}
	/**
	 * 删除配矿详细 子表信息
	 * @param ids
	 * @param pkxxId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("delPkxxDetail")
	@ResponseBody
	public Map<String, Object> delPkxxDetail(PkxxDetail pkxxDetail) throws Exception{
		return pkxxDetailService.delPkxxDetail(pkxxDetail);
	}
	
	/**
	 * 删除配矿信息  删除主表
	 * @param pkxx
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Pkxx pkxx,ModelMap modelMap) throws Exception{
		pkxxService.del(pkxx);
		modelMap.put("message", "删除成功!");
		return pkxxList(pkxx, modelMap);
	}
	
	/**
	 * 给矿统计页面
	 * 投矿单位品位的曲线图（每个车间每一次配矿综合品位的变化曲线）
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("geikuangtongji")
	public ModelAndView geikuangtongji(ModelMap modelMap) throws Exception{
		modelMap.put("pkxxList", pkxxService.select(null));
		return new ModelAndView(PkxxController.PKXX_GKTJ,modelMap);
	}
	
}
