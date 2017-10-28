package org.haze.mfm.mater.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.haze.base.util.DateUtil;
import org.haze.mfm.mater.model.Stock;
import org.haze.mfm.mater.model.StockDetail;
import org.haze.mfm.mater.service.AresService;
import org.haze.mfm.mater.service.StockDetailService;
import org.haze.mfm.mater.service.StockService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：StockController 
 * 程序说明：库存管理 
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月18日 上午10:06:55
 * @author 王亚茹
 */
@Controller
@RequestMapping("/Stock/")
public class StockController {
	public final static String CHECI_FENQU = "gresource/mfm/mater/stock/checiFenqu.jsp";//车次分区页面 车次分区功能是增加库存
	public final static String CHECI_GET = "gresource/mfm/mater/stock/checiGet.jsp";//车次的详细信息页面
	public final static String STOCK_LIST = "gresource/mfm/mater/stock/stockList.jsp";//入库记录 简单查询
	public final static String STOCK_EDIT = "gresource/mfm/mater/stock/stockEdit.jsp";//修改入库记录
	public final static String STOCK_CHAXUN = "gresource/mfm/mater/stock/stockChaxun.jsp";//库存查询  折线图
	@Resource
	private StockService stockService;//库存管理service
	@Resource
	private StockDetailService stockDetailService;//库存管理的详细service
	@Resource
	private AresService aresService;
	/**
	 * 跳入车次分区页面
	 * @return
	 */
	@RequestMapping("checiFenqu")
	public ModelAndView checiFenqu(ModelMap modelMap,String isAdd){
		modelMap.put("getTime", DateUtil.getString(new Date(), "yyyy-MM-dd"));//将当前时间返回页面
		modelMap.put("isAdd", isAdd);//1表示是从入库记录跳转过去的
		return new ModelAndView(StockController.CHECI_FENQU,modelMap);
	}
	
	/**
	 * 跳入车次信息详细页面
	 * @return
	 */
	@RequestMapping("checiGet")
	public ModelAndView checiGet(){
		return new ModelAndView(StockController.CHECI_GET);
	}
	
	/**
	 * 保存车次分区记录 同时往车次详细记录里增加数据
	 * @throws Exception 
	 */
	@RequestMapping("saveCheciFenqu")
	@ResponseBody
	public boolean saveCheciFenqu(Stock stock) throws Exception{
		return stockService.saveCheciFenqu(stock);
	}
	
	/**
	 * 库存查询  简单查询
	 * @param stock
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Stock stock,ModelMap modelMap){
		return new ModelAndView(StockController.STOCK_LIST,modelMap);
	}
	
	/**
	 * 得到列表json
	 * @param stock
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Stock stock) throws Exception{
		return stockService.easyUIJson(stock, stock.getPageBean());
	}
	
	/**
	 * 根据入库记录查询入库的车次详细
	 * @param stockDetail
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getStockDetailList")
	@ResponseBody
	public Object getStockDetailList(StockDetail stockDetail) throws Exception{
		return stockDetailService.easyUIJson(stockDetail,stockDetail.getPageBean());
	}
	
	/**
	 * 修改入库记录
	 * @param stock
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("stockEdit")
	public ModelAndView stockEdit(Stock stock,ModelMap modelMap) throws Exception{
		Long id = stock.getId();//获取要修改的入库记录id
		modelMap.put("stock", stockService.selectOne(id));
		return new ModelAndView(StockController.STOCK_EDIT,modelMap);
	}
	
	/**
	 * 保存修改后的入库记录
	 * @param stock
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("saveEdit")
	public ModelAndView saveEdit(Stock stock,ModelMap modelMap) throws Exception{
		stockService.update(stock);
		modelMap.put("message", "修改成功!");
		return stockEdit(stock,modelMap);
	}
	
	/**
	 * 删除入库记录 删除主表信息的时候 连同子表一块删除
	 * @param stock
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Stock stock,ModelMap modelMap) throws Exception{
		stockService.del(stock);
		modelMap.put("message", "删除成功!");
		return list(stock, modelMap);
	}
	
	/**
	 * 删除入库记录的详细信息
	 * @param ids
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("delStockDetail")
	@ResponseBody
	public Map<String, Object> delStockDetail(StockDetail stockDetail) throws Exception{
		return stockDetailService.delStockDetail(stockDetail);
	}
	
	/**
	 * 库存查询页面   折线图
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("kuchaxun")
	public ModelAndView kuchaxun(ModelMap modelMap) throws Exception{
		modelMap.put("aresList", aresService.select(null));
		return new ModelAndView(StockController.STOCK_CHAXUN,modelMap);
	}
	
	/**
	 * 获取库存查询的 数据
	 * @param beginDate
	 * @param endDate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getKuchaxun")
	@ResponseBody
	public List<Map<String, Object>> getKuchaxun(String beginDate, String endDate) throws Exception{
		List<Map<String, Object>> listRet = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> list = stockDetailService.selectDarkMine(beginDate, endDate);//获取每一个区域的入库量
		 if(null != list && list.size()>0){
			 for (Map<String, Object> map : list) {
				String aresId = map.get("aresId").toString();//区域ID
				Object darkMineObj = map.get("darkMine");//干矿
				if(null != darkMineObj){//该区有干矿量 说明有车次
					String darkMine = darkMineObj.toString();
					Map<String, Object> pkMap = stockDetailService.selectPkmine(beginDate, endDate, aresId);//查询出某一区域的配矿量
					if(null != pkMap && !pkMap.isEmpty()){//如果有配矿信息
						String pkMine = pkMap.get("pkMine").toString();
						Double stockMineDouble = Double.valueOf(darkMine)-Double.valueOf(pkMine);//库存量
						map.put("pkMine", pkMine);
						map.put("stockMine", String.valueOf(stockMineDouble));
					}else{//如果没有配矿信息
						map.put("pkMine", "0");
						map.put("stockMine",darkMine);
					}
				}else{
					map.put("darkMine", "0");
					map.put("pkMine", "0");
					map.put("stockMine","0");
				}
				listRet.add(map);
			}
		 }
		 return listRet;
	}
}
