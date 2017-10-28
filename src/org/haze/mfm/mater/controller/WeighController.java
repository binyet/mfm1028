package org.haze.mfm.mater.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.haze.base.util.JsonUtil;
import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.dao.WeighDao;
import org.haze.mfm.mater.model.Ares;
import org.haze.mfm.mater.model.Client;
import org.haze.mfm.mater.model.Property;
import org.haze.mfm.mater.model.Weigh;
import org.haze.mfm.mater.service.ClientService;
import org.haze.mfm.mater.service.PropertyService;
import org.haze.mfm.mater.service.WeighService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * 程序名称：WeighController
 * 程序说明：称重管理部分
 * 版权信息:
 * 时间：2017年10月13日 下午4:55:50
 * @author 鲁彬
 */
@Controller
@RequestMapping("/Weigh/")
public class WeighController {
	
	public static String WEIGH_LIST ="gresource/mfm/mater/weigh/weighList.jsp";//称重管理页面
	public static String WEIGH_EDIT ="gresource/mfm/mater/weigh/weighEdit.jsp";//称重编辑页面
	public static String WEIGH_REVISE ="gresource/mfm/mater/weigh/weighRevise.jsp";//称重编辑页面
	public static String WEIGH_PRINT = "gresource/mfm/mater/weigh/testPrint.jsp";//打印页面
	public static String WEIGHREPORT_LIST = "gresource/mfm/mater/weigh/weighRecord.jsp";//入库记录页面

	@Resource
	private WeighService weighService;
	
	@Resource
	private ClientService clientService;
	
	@Resource
	private PropertyService propertyService;
	
	@Resource
	private WeighDao weighDao;
	/**
	 * 进入列表页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Weigh weigh, ModelMap modelMap){
		return new ModelAndView(WeighController.WEIGH_LIST, modelMap);
	}
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Weigh weigh) throws Exception{
		return weighService.easyUIJson(weigh, weigh.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param weigh
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Weigh weigh) throws Exception{
		return weighService.select(weigh);
	}
	
	@RequestMapping("getOne")
	@ResponseBody
	public Map<String,Object> getOne(HttpServletRequest request,HttpServletResponse response) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();  
        
        map.put("msg", getCheci(request.getParameter("client")));
        return map;
	}

	public int checi = 1;
	public String getCheci(String clientName) throws Exception{
		Client client = new Client();
		List<Client> clientList = clientService.select(client);//将所有数据记录到List中，遍历所有数据已经按照时间排序

		for(int i=0;i<clientList.size();i++){//从最近的时间开始
			if(clientList.get(i).getClientName().equals(clientName)){//遍历到车号对应的最近的车辆信息
				int checi = Integer.parseInt(clientList.get(i).getCheci())+1;
					return (checi)+"";
			}
		}
		return "1";//如果没有找到该车号，说明该车第一次出现
	}
	/**
	 * 跳进编辑页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Weigh weigh,ModelMap modelMap) throws Exception{
		
		Long id = weigh.getId();
		if(null != id && id != 0L){//如果有id就是修改
			weigh = weighService.selectOne(id);
			modelMap.put("weigh", weigh);
			return new ModelAndView(WeighController.WEIGH_LIST,modelMap);
		}else{//新增
			weigh = new Weigh();
			modelMap.put("weigh", weigh);
			return new ModelAndView(WeighController.WEIGH_LIST,modelMap);
		}
		
	}
	/**
	 * 通过客户名获取到客户的ID
	 * @return
	 * @throws Exception 
	 */
	public Long getClientID(Weigh weigh) throws Exception{
//		String clientName = weigh.getClient();
		Client client = new Client();
		client.setClientName(weigh.getClient());
		List<Client> clientList = clientService.select(client);
//		System.out.println(clientList.size());
//		for(int i=0;i<clientList.size();i++){
//			if(clientList.get(i).getClientName().equals(clientName)){
//				return clientList.get(i).getId();
//			}
//		}
		if(clientList.size() != 0){
			return clientList.get(0).getId();
		}
		return null;
	}
	
	/**
	 * 保存
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("subsave")
	public ModelAndView subsave(Weigh weigh,ModelMap modelMap) throws Exception{
		Long id = weigh.getId();
		if(null != id && id != 0L){//如果有id就是修改
			double jinghzongD = Double.parseDouble(weigh.getMaozhong()) - Double.parseDouble(weigh.getPizhong());
			weigh.setJingzhong(jinghzongD+"");
			
//			System.out.println(getClientID(weigh));
			weigh.setClient(getClientID(weigh)+"");
			
			 weighService.update(weigh);
			 modelMap.put("message", "修改成功!");
		}else{//新增
			String checi = getCheci(weigh.getClient());//根据客户名获取车次
			
			updateCleint(weigh, checi);//对客户车次进行更新维护, 根据称重表中的客户名
			
			weigh.setClient(getClientID(weigh)+"");
			weigh.setProperty(getPropertyID(weigh)+"");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			weigh.setWeighDate(df.format(new Date()));
			weigh.setId(UniqueIdUtil.genId());//添加Id
			weigh.setCheci(checi);
			double PizhongD = 0; 
			try{
				PizhongD = Double.parseDouble(weigh.getPizhong());	
				double jinghzongD = Double.parseDouble(weigh.getMaozhong()) - PizhongD;
				weigh.setJingzhong(jinghzongD+"");
			}
			catch(Exception e){
				weigh.setJingzhong("");
			}
			weighService.insert(weigh);
			 modelMap.put("message", "保存成功!");
		}
		return edit(weigh, modelMap);
	}
	
	private Long getPropertyID(Weigh weigh) throws Exception {
		// TODO Auto-generated method stub
		Property property = new Property();
		property.setPropertyName(weigh.getProperty());
		List<Property> propertyList = propertyService.select(property);
		if(propertyList.size() != 0){
			return propertyList.get(0).getId();
		}
		return null;
	}

	/**
	 * 主要是获取称重的客户名，和车次，来对客户数据表进行维护更新
	 * @param weigh
	 * @param checi
	 * @throws Exception
	 */
	private void updateCleint(Weigh weigh, String checi) throws Exception {
		// TODO Auto-generated method stub
		Long clientID = getClientID(weigh);
		Client client = clientService.selectOne(clientID);
		client.setCheci(checi);
		clientService.update(client);
	}

	/**
	 * 打印部分
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	 @RequestMapping("testPrint")
	 public ModelAndView testReportCcyPrint(Weigh weigh, ModelMap modelMap) throws Exception{
		 return new ModelAndView(WeighController.WEIGH_PRINT, modelMap);
	 }
	
	 
	 /**
	 * 进入记录页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("record")
	public ModelAndView record(Weigh weigh, ModelMap modelMap){
		return new ModelAndView(WeighController.WEIGHREPORT_LIST, modelMap);
	}
	
	
	@RequestMapping("getReportList")
	@ResponseBody
	public Object getReportList(Weigh weigh) throws Exception{
		if(weigh.getEndDate() != null && weigh.getEndDate() != ""){//如果endTime没有输入，那么默认是今天
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
			 Calendar calendar = new GregorianCalendar(); 
			 Date date = sdf.parse(weigh.getEndDate()); 
			 calendar.setTime(date); 
			 calendar.add(Calendar.DAY_OF_YEAR,1);//把日期往后增加一天.整数往后推,负数往前移动 
			 //查询结果是到endtime的0点0分，因此不会查询到endtime的数据，需要将endtime往后加一天
			 date = calendar.getTime();
			 weigh.setEndDate((new SimpleDateFormat("yyyy-MM-dd")).format(date));
		}
	   
		return weighService.easyUIJson(weigh, weigh.getPageBean());
	}
	
	
	@RequestMapping("search")
	public ModelAndView search(Weigh weigh, ModelMap modelMap){
		return new ModelAndView(WeighController.WEIGHREPORT_LIST, modelMap);
	}
	
	 /**
	  * 导出excel 
	  * @param sampleTasteReport
	  * @param response
	  * @throws Exception
	  */
	 @RequestMapping(value="/toTasteQueryExcelTaste")
	 public void toTasteQueryExcelTaste(Weigh weigh, HttpServletRequest request, HttpServletResponse response) throws Exception{
		 weighService.toTasteQueryExcelTaste(weigh, request, response);

	 }
}
