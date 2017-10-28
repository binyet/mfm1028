package org.haze.mfm.mater.controller;

import javax.annotation.Resource;

import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.model.Auditor;
import org.haze.mfm.mater.service.AuditorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：AuditorController
 * 程序说明：监磅人管理
 * 版权信息:
 * 时间：2017年10月28日 下午7:53:29
 * @author 
 */
@Controller
@RequestMapping("/Auditor/")
public class AuditorController {
	public static String AUDITOR_LIST = "gresource/mfm/mater/auditor/auditorList.jsp";//监磅人列表页面
	public static String AUDITOR_EDIT = "gresource/mfm/mater/auditor/auditorEdit.jsp";//监磅人修改添加页面
	
	@Resource
	private AuditorService auditorService;
	
	/**
	 * 跳进监磅人管理列表
	 * @param Auditor
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Auditor auditor,ModelMap modelMap){
		return new ModelAndView(AuditorController.AUDITOR_LIST,modelMap);
	}
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Auditor auditor) throws Exception{
		return auditorService.easyUIJson(auditor, auditor.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param auditor
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Auditor auditor) throws Exception{
		return auditorService.select(auditor);
	}
	
	
	
	/**
	 * 跳进编辑页面
	 * @param auditor
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Auditor auditor,ModelMap modelMap) throws Exception{
		Long id = auditor.getId();
		if(null != id && id != 0L){//如果有id就是修改
			auditor = auditorService.selectOne(id);
		}else{//新增

			auditor = new Auditor();
		}
		modelMap.put("auditor", auditor);
		return new ModelAndView(AuditorController.AUDITOR_EDIT,modelMap);		
	}

	/**
	 * 保存
	 * @param auditor
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Auditor auditor,ModelMap modelMap) throws Exception{
		Long id = auditor.getId();
		if(null != id && id != 0L){//如果有id就是修改
			auditorService.update(auditor);
			modelMap.put("message", "修改成功!");
		}else{//新增
			auditor.setId(UniqueIdUtil.genId());//添加Id
			auditorService.insert(auditor);
			 modelMap.put("message", "保存成功!");
		}
		return edit(auditor, modelMap);
	}
	
	/**
	 * 删除信息
	 * @param auditor
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Auditor auditor,ModelMap modelMap) throws Exception{
		auditorService.delById(auditor.getIds());
		return list(auditor, modelMap);
	}

}
