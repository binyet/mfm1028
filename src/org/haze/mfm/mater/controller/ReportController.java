package org.haze.mfm.mater.controller;

import java.util.List;

import javax.annotation.Resource;

import org.haze.base.util.JsonUtil;
import org.haze.mfm.mater.dao.ReportDao;
import org.haze.mfm.mater.model.Report;
import org.haze.mfm.mater.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：ReportController
 * 程序说明：化验结果
 * 版权信息:
 * 时间：2017年10月26日 上午8:28:16
 * @author 
 */
@Controller
@RequestMapping("/Report/")
public class ReportController {
	public static String ARESWEIGH_LIST = "gresource/mfm/mater/checiHB/checiHB.jsp";
	public static String PEIKUANG_LIST = "gresource/mfm/mater/checiHB/pkHB.jsp";
	public static String PEIKUANG_NEW_LIST = "gresource/mfm/mater/checiHB/PkNew.jsp";

	
	@Resource
	private ReportService reportService;
	
	@Resource
	private ReportDao reportDao;
	
	@RequestMapping("list")
	public ModelAndView list(Report report, ModelMap modelMap){
		return new ModelAndView(ReportController.ARESWEIGH_LIST, modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Report report) throws Exception{
		return reportService.easyUIJson(report, report.getPageBean());
	}
}
