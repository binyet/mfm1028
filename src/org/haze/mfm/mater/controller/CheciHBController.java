package org.haze.mfm.mater.controller;


import javax.annotation.Resource;

import org.haze.mfm.mater.dao.CheciHBDao;
import org.haze.mfm.mater.model.CheciHB;
import org.haze.mfm.mater.service.CheciHBService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：CheciHBController
 * 程序说明：车次合并
 * 版权信息:
 * 时间：2017年10月20日 上午11:52:01
 * @author 鲁彬
 */
@Controller
@RequestMapping("/CheciHB/")
public class CheciHBController {
	public static String CHECIHB_LIST = "gresource/mfm/mater/checiHB/checiHB.jsp";
	
	@Resource
	private CheciHBService checiHBService;
	
	@Resource
	private CheciHBDao checiHBDao;
	
	
	@RequestMapping("list")
	public ModelAndView list(CheciHB checiHB, ModelMap modelMap){
		return new ModelAndView(CheciHBController.CHECIHB_LIST, modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(CheciHB checiHB) throws Exception{
		
		Long id = checiHB.getId();
		checiHB = checiHBService.selectOne(id);
//		System.out.println(checiHB.getId()+" "+checiHB.getAresName());
		return checiHBService.easyUIJson(checiHB, checiHB.getPageBean());
	}
	
	


}
