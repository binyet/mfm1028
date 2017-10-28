package org.haze.mfm.mater.controller;
import javax.annotation.Resource;

import org.haze.mfm.mater.model.Weigher;
import org.haze.mfm.mater.service.WeigherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：WeigherController
 * 程序说明：过磅人下拉列表信息部分
 * 版权信息:
 * 时间：2017年10月14日 下午3:01:28
 * @author 鲁彬
 */

@Controller
@RequestMapping("/Weigher/")
public class WeigherController {
	public final static String WEIGHER_LIST ="greClient/mfm/mater/weigh/weighList.jsp";//称重管理页面
	public final static String WEIGHER_EDIT ="greClient/mfm/mater/weigh/weighEdit.jsp";//称重编辑页面
	
	
	@Resource
	private WeigherService weigherService;//来源管理service
	
	/**
	 * 跳进区域管理列表
	 * @param ares
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Weigher weigher,ModelMap modelMap){
		return new ModelAndView(WeigherController.WEIGHER_LIST,modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Weigher weigher) throws Exception{
		return weigherService.easyUIJson(weigher, weigher.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param ares
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Weigher weigher) throws Exception{
		return weigherService.select(weigher);
	}
	
	/**
	 * 跳进编辑页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Weigher weigher,ModelMap modelMap) throws Exception{
		return new ModelAndView(WeigherController.WEIGHER_EDIT,modelMap);
	}


}
