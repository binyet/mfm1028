package org.haze.mfm.mater.controller;

import javax.annotation.Resource;
import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.model.Property;
import org.haze.mfm.mater.service.PropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：PropertyController
 * 程序说明：性质下拉列表部分
 * 版权信息:
 * 时间：2017年10月14日 下午3:01:28
 * @author 鲁彬
 */

@Controller
@RequestMapping("/Property/")
public class PropertyController {
	public final static String PROPERTY_LIST ="gresource/mfm/mater/property/propertyList.jsp";//称重管理页面
	public final static String PROPERTY_EDIT ="gresource/mfm/mater/property/propertyEdit.jsp";//称重编辑页面
	
	
	@Resource
	private PropertyService propertyService;//来源管理service
	
	/**
	 * 跳进区域管理列表
	 * @param ares
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Property property,ModelMap modelMap){
		return new ModelAndView(PropertyController.PROPERTY_LIST,modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Property property) throws Exception{
		return propertyService.easyUIJson(property, property.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param ares
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Property property) throws Exception{
		return propertyService.select(property);
	}
	
	/**
	 * 跳进编辑页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Property property,ModelMap modelMap) throws Exception{
		Long id = property.getId();
		if(null != id && id != 0L){//如果有id就是修改
			property = propertyService.selectOne(id);
		}else{//新增
			property = new Property();
		}
		modelMap.put("property", property);
		return new ModelAndView(PropertyController.PROPERTY_EDIT,modelMap);		
	}

	
	/**
	 * 保存
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Property property,ModelMap modelMap) throws Exception{
		Long id = property.getId();
		if(null != id && id != 0L){//如果有id就是修改
			propertyService.update(property);
			modelMap.put("message", "修改成功!");
		}else{//新增
			property.setId(UniqueIdUtil.genId());//添加Id
			propertyService.insert(property);
			 modelMap.put("message", "保存成功!");
		}
		return edit(property, modelMap);
	}
	
	/**
	 * 删除信息
	 * @param dept
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Property property,ModelMap modelMap) throws Exception{
		propertyService.delById(property.getIds());
		return list(property, modelMap);
	}

}
