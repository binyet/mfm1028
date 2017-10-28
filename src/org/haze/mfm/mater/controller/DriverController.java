package org.haze.mfm.mater.controller;


import javax.annotation.Resource;

import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.model.Driver;
import org.haze.mfm.mater.service.DriverService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：DriverController
 * 程序说明：司机下拉列表部分
 * 版权信息:
 * 时间：2017年10月14日 下午3:01:28
 * @author 鲁彬
 */

@Controller
@RequestMapping("/Driver/")
public class DriverController {
	public final static String DRIVER_LIST ="gresource/mfm/mater/driver/driverList.jsp";//称重管理页面
	public final static String DRIVER_EDIT ="gresource/mfm/mater/driver/driverEdit.jsp";//称重编辑页面
	
	
	@Resource
	private DriverService driverService;//来源管理service
	
	/**
	 * 跳进区域管理列表
	 * @param ares
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Driver driver,ModelMap modelMap){
		return new ModelAndView(DriverController.DRIVER_LIST,modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Driver driver) throws Exception{
		System.out.println(driver.getClientName());
		return driverService.easyUIJson(driver, driver.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param ares
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Driver driver) throws Exception{
		return driverService.select(driver);
	}
	
	/**
	 * 跳进编辑页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Driver driver,ModelMap modelMap) throws Exception{
		Long id = driver.getId();
		if(null != id && id != 0L){//如果有id就是修改
			driver = driverService.selectOne(id);
		}else{//新增

			driver = new Driver();
		}
		modelMap.put("driver", driver);
		return new ModelAndView(DriverController.DRIVER_EDIT,modelMap);	
	}

	
	/**
	 * 保存
	 * @param driver
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Driver driver,ModelMap modelMap) throws Exception{
		Long id = driver.getId();
		if(null != id && id != 0L){//如果有id就是修改
			driverService.update(driver);
			modelMap.put("message", "修改成功!");
		}else{//新增
			driver.setId(UniqueIdUtil.genId());//添加Id
			driverService.insert(driver);
			 modelMap.put("message", "保存成功!");
		}
		return edit(driver, modelMap);
	}
	
	
	
	/**
	 * 删除信息
	 * @param dept
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Driver driver,ModelMap modelMap) throws Exception{
		driverService.delById(driver.getIds());
		return list(driver, modelMap);
	}
	
}
