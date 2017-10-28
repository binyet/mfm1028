package org.haze.mfm.mater.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.dao.MonitorDao;
import org.haze.mfm.mater.model.Monitor;
import org.haze.mfm.mater.model.Weigh;
import org.haze.mfm.mater.service.MonitorService;
import org.haze.mfm.mater.service.WeighService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * 程序名称：MonitorController
 * 程序说明：监磅称重管理部分
 * 版权信息:
 * 时间：2017年10月16日 下午4:55:50
 * @author 鲁彬
 */
@Controller
@RequestMapping("/Monitor/")
public class MonitorController {
	
	public final static String MONITOR_LIST ="gresource/mfm/mater/monitor/MonitorList.jsp";//称重管理页面
	public final static String MONITOR_EDIT ="gresource/mfm/mater/monitor/MonitorEdit.jsp";//称重编辑页面
	public final static String MONITOR_REVISE ="gresource/mfm/mater/monitor/MonitorRevise.jsp";//称重编辑页面

    
	@Resource
	private MonitorService monitorService;
	
	@Resource
	private WeighService weighService;
	
	@Resource
	private MonitorDao monitorDao;
	/**
	 * 进入列表页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Monitor monitor, ModelMap modelMap){
		return new ModelAndView(MonitorController.MONITOR_LIST, modelMap);
	}
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Monitor monitor) throws Exception{
		return monitorService.easyUIJson(monitor, monitor.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param weigh
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Monitor monitor) throws Exception{
		return monitorService.select(monitor);
	}
	
	@RequestMapping("getOne")
	@ResponseBody
	public Map<String,Object> getOne(HttpServletRequest request,HttpServletResponse response) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();  
        
        map.put("msg", getCheci(request.getParameter("carNum")));
        return map;
	}
	
	public String getCheci(String carNum) throws Exception{
		Weigh w = new Weigh();
		List<Weigh> weighList = weighService.select(w);//将所有数据记录到List中，遍历所有数据已经按照时间排序
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
    	Date date = new Date();
    	String currYear = sdf.format(date);
		for(int i=0;i<weighList.size();i++){//从最近的时间开始
			if(weighList.get(i).getCarNum().equals(carNum)){//遍历到车号对应的最近的车辆信息
				String year = weighList.get(i).getWeighDate().substring(0, 4);//判断是否是今年的
				if(year.equals(currYear)){//如果是，返回该车次加一
					
					int checi = Integer.parseInt(weighList.get(i).getCheci());
					return checi+"";
				}
				else{//如果不是今年的，直接返回1
					return "1";
				}
			}
		}
		return "1";//如果没有找到改车号，说明该车第一次出现
	}
	/**
	 * 跳进编辑页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Monitor monitor,ModelMap modelMap) throws Exception{
		
		Long id = monitor.getId();
		if(null != id && id != 0L){//如果有id就是修改
			monitor = monitorService.selectOne(id);
			modelMap.put("weigh", monitor);
			return new ModelAndView(MonitorController.MONITOR_REVISE,modelMap);
		}else{//新增
			monitor = new Monitor();
			modelMap.put("weigh", monitor);
			return new ModelAndView(MonitorController.MONITOR_EDIT,modelMap);
		}
		
	}
	
	
	/**
	 * 保存
	 * @param monitor
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Monitor monitor,ModelMap modelMap) throws Exception{

		Long id = monitor.getId();
		if(null != id && id != 0L){//如果有id就是修改
			monitorService.update(monitor);
			modelMap.put("message", "修改成功!");
		}else{//新增
			System.out.println("save");

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			monitor.setWeighDate(df.format(new Date()));
			monitor.setId(UniqueIdUtil.genId());//添加Id
			
			monitor.setId(UniqueIdUtil.genId());//添加Id
			monitorService.insert(monitor);
			 modelMap.put("message", "保存成功!");
		}
		return edit(monitor, modelMap);
	}

	
}
