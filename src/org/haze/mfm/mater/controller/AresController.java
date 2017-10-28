package org.haze.mfm.mater.controller;

import javax.annotation.Resource;
import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.model.Ares;
import org.haze.mfm.mater.service.AresService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：AresController 
 * 程序说明：区域管理
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月16日 下午4:21:18
 * @author 王亚茹
 */
@Controller
@RequestMapping("/Ares/")
public class AresController {
	public final static String ARES_LIST ="gresource/mfm/mater/ares/aresList.jsp";//区域管理列表页面
	public final static String ARES_EDIT ="gresource/mfm/mater/ares/aresEdit.jsp";//区域管理编辑页面
	
	@Resource
	private AresService aresSevrice;//区域管理service
	
	/**
	 * 跳进区域管理列表
	 * @param ares
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Ares ares,ModelMap modelMap){
		return new ModelAndView(AresController.ARES_LIST,modelMap);
	}
	
	/**
	 * 获取区域管理列表的分页json
	 * @param ares
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Ares ares) throws Exception{
		return aresSevrice.easyUIJson(ares, ares.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param ares
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Ares ares) throws Exception{
		return aresSevrice.select(ares);
	}
	
	/**
	 * 跳进编辑页面
	 * @param ares
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Ares ares,ModelMap modelMap) throws Exception{
		Long id = ares.getId();
		if(null != id && id != 0L){//如果有id就是修改
			ares = aresSevrice.selectOne(id);
		}else{//新增
			ares = new Ares();
		}
		modelMap.put("ares", ares);
		return new ModelAndView(AresController.ARES_EDIT,modelMap);
	}
	
	/**
	 * 保存
	 * @param ares
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Ares ares,ModelMap modelMap) throws Exception{
		Long id = ares.getId();
		if(null != id && id != 0L){//如果有id就是修改
			 aresSevrice.update(ares);
			 modelMap.put("message", "修改成功!");
		}else{//新增
			ares.setId(UniqueIdUtil.genId());//添加Id
			aresSevrice.insert(ares);
			 modelMap.put("message", "保存成功!");
		}
		return edit(ares, modelMap);
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	@ResponseBody
	public Object del(Ares ares) throws Exception{
		return aresSevrice.del(ares.getIds());
	}
}
