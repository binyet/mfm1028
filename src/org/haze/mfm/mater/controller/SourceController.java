package org.haze.mfm.mater.controller;


import javax.annotation.Resource;
import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.model.Client;
import org.haze.mfm.mater.model.Source;
import org.haze.mfm.mater.service.SourceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：SourceController
 * 程序说明：来源信息下拉列表显示
 * 版权信息:
 * 时间：2017年10月14日 下午3:01:28
 * @author 鲁彬
 */

@Controller
@RequestMapping("/Source/")
public class SourceController {
	public final static String SOURCE_LIST ="gresource/mfm/mater/source/sourceList.jsp";//称重管理页面
	public final static String SOURCE_EDIT ="gresource/mfm/mater/source/sourceEdit.jsp";//称重编辑页面
	
	
	@Resource
	private SourceService sourceService;//来源管理service
	
	/**
	 * 跳进区域管理列表
	 * @param ares
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Source suource,ModelMap modelMap){
		return new ModelAndView(SourceController.SOURCE_LIST,modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Source source) throws Exception{
		return sourceService.easyUIJson(source, source.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param ares
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Source source) throws Exception{
		return sourceService.select(source);
	}
	
	/**
	 * 跳进编辑页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Source source,ModelMap modelMap) throws Exception{
		Long id = source.getId();
		if(null != id && id != 0L){//如果有id就是修改
			source = sourceService.selectOne(id);
		}else{//新增

			source = new Source();
		}
		modelMap.put("source", source);
		return new ModelAndView(SourceController.SOURCE_EDIT,modelMap);		
	}

	
	/**
	 * 保存
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Source source,ModelMap modelMap) throws Exception{
		Long id = source.getId();
		if(null != id && id != 0L){//如果有id就是修改
			sourceService.update(source);
			modelMap.put("message", "修改成功!");
		}else{//新增
			source.setId(UniqueIdUtil.genId());//添加Id
			sourceService.insert(source);
			 modelMap.put("message", "保存成功!");
		}
		return edit(source, modelMap);
	}
	
	/**
	 * 删除信息
	 * @param dept
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Source source,ModelMap modelMap) throws Exception{
		sourceService.delById(source.getIds());
		return list(source, modelMap);
	}

}
