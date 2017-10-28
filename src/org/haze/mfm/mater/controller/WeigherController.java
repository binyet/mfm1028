package org.haze.mfm.mater.controller;
import javax.annotation.Resource;

import org.haze.base.util.UniqueIdUtil;
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
	public final static String WEIGHER_LIST ="gresource/mfm/mater/weigher/weigherList.jsp";//过磅人管理页面
	public final static String WEIGHER_EDIT ="gresource/mfm/mater/weigher/weigherEdit.jsp";//过磅人编辑页面
	
	
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
		Long id = weigher.getId();
		if(null != id && id != 0L){//如果有id就是修改
			weigher = weigherService.selectOne(id);
		}else{//新增

			weigher = new Weigher();
		}
		modelMap.put("weigher", weigher);
		return new ModelAndView(WeigherController.WEIGHER_EDIT,modelMap);
	}


	
	/**
	 * 保存
	 * @param weigher
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Weigher weigher,ModelMap modelMap) throws Exception{
		Long id = weigher.getId();
		if(null != id && id != 0L){//如果有id就是修改
			weigherService.update(weigher);
			modelMap.put("message", "修改成功!");
		}else{//新增
			weigher.setId(UniqueIdUtil.genId());//添加Id
			weigherService.insert(weigher);
			 modelMap.put("message", "保存成功!");
		}
		return edit(weigher, modelMap);
	}
	
	/**
	 * 删除信息
	 * @param weigher
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Weigher weigher,ModelMap modelMap) throws Exception{
		weigherService.delById(weigher.getIds());
		return list(weigher, modelMap);
	}

}
