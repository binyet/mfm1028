package org.haze.mfm.mater.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.model.Dept;
import org.haze.mfm.mater.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：DeptController 
 * 程序说明：投料单位的维护
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年6月8日 下午2:27:40
 * @author 王亚茹
 */
@Controller
@RequestMapping("Dept")
public class DeptController {

	public final static String DEPT_LIST ="gresource/mfm/mater/dept/deptList.jsp";//列表页面
	public final static String DEPT_EDIT ="gresource/mfm/mater/dept/deptEdit.jsp";//编辑页面
	
	@Resource
	private DeptService deptService;
	
	/**
	 * 数据列表页面
	 * @param dept
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Dept dept,ModelMap modelMap){
		return new ModelAndView(DeptController.DEPT_LIST,modelMap);
	}
	
	/**
	 * 获取列表数据
	 * @param dept
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getList")
	@ResponseBody
	public Map<String, Object> getList(Dept dept) throws Exception{
		return deptService.easyUIJson(dept, dept.getPageBean());
	}
	
	/**
	 * 获取列表数据
	 * @param dept
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Dept dept) throws Exception{
		return deptService.select(dept);
	}
	/**
	 * 跳入编辑页面
	 * @param dept
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Dept dept,ModelMap modelMap) throws Exception{
		Long id = dept.getId();
		if(null != id && id != 0L){//如果有id 说明是修改页面 将原数据返回去
			dept = deptService.selectOne(id);
		}
		modelMap.put("dept", dept);
		return new ModelAndView(DeptController.DEPT_EDIT,modelMap);
	}
	
	/**
	 * 保存编辑信息
	 * @param dept
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("save")
	public ModelAndView save(Dept dept,ModelMap modelMap) throws Exception{
		Long id = dept.getId();
		if(null != id && id != 0L){//如果有id 说明是修改
			deptService.update(dept);
			modelMap.put("message","修改成功！！！");
		}else{
			dept.setId(UniqueIdUtil.genId());
			deptService.insert(dept);
			modelMap.put("message","保存成功！！！");
		}
		return edit(dept, modelMap);
	}
	
	/**
	 * 删除信息
	 * @param dept
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Dept dept,ModelMap modelMap) throws Exception{
		deptService.delById(dept.getIds());
		return list(dept, modelMap);
	}
}
