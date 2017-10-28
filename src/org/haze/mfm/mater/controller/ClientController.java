package org.haze.mfm.mater.controller;


import java.util.List;

import javax.annotation.Resource;

import org.haze.base.util.UniqueIdUtil;
import org.haze.mfm.mater.model.Ares;
import org.haze.mfm.mater.model.Client;
import org.haze.mfm.mater.model.Dept;
import org.haze.mfm.mater.service.ClientService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：ClientController
 * 程序说明：客户下拉列表部分
 * 版权信息:
 * 时间：2017年10月14日 下午3:01:28
 * @author 鲁彬
 */

@Controller
@RequestMapping("/Client/")
public class ClientController {
	public final static String CLIENT_LIST ="gresource/mfm/mater/client/clientList.jsp";//称重管理页面
	public final static String CLIENT_EDIT ="gresource/mfm/mater/client/clientEdit.jsp";//称重编辑页面
	
	
	@Resource
	private ClientService clientService;//来源管理service
	
	/**
	 * 跳进区域管理列表
	 * @param ares
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("list")
	public ModelAndView list(Client client,ModelMap modelMap){
		return new ModelAndView(ClientController.CLIENT_LIST,modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(Client client) throws Exception{
		return clientService.easyUIJson(client, client.getPageBean());
	}
	
	/**
	 * 获取区域管理列表的json
	 * @param ares
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("getComboboxList")
	@ResponseBody
	public Object getComboboxList(Client client) throws Exception{
		return clientService.select(client);
	}
	
	/**
	 * 跳进编辑页面
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("edit")
	public ModelAndView edit(Client client,ModelMap modelMap) throws Exception{
		Long id = client.getId();
		if(null != id && id != 0L){//如果有id就是修改
			client = clientService.selectOne(id);
		}else{//新增

			client = new Client();
		}
		modelMap.put("client", client);
		return new ModelAndView(ClientController.CLIENT_EDIT,modelMap);	
	}

	
	/**
	 * 保存
	 * @param weigh
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("save")
	public ModelAndView save(Client client,ModelMap modelMap) throws Exception{
		Long id = client.getId();
		if(null != id && id != 0L){//如果有id就是修改
			clientService.update(client);
			modelMap.put("message", "修改成功!");
		}else{//新增
			client.setId(UniqueIdUtil.genId());//添加Id
			clientService.insert(client);
			 modelMap.put("message", "保存成功!");
		}
		return edit(client, modelMap);
	}
	
	
	/**
	 * 删除信息
	 * @param dept
	 * @param modelMap
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("del")
	public ModelAndView del(Client client,ModelMap modelMap) throws Exception{
		clientService.delById(client.getIds());
		return list(client, modelMap);
	}
	
	@RequestMapping("reset")
	public ModelAndView reset(Client client, ModelMap modelMap) throws Exception{
		List<Client> clientList = clientService.select(client);
		for(int i = 0; i<clientList.size(); i++){
			Client c = clientList.get(i);
			c.setCheci("0");
			clientService.update(c);
		}
		return new ModelAndView(ClientController.CLIENT_LIST, modelMap);
	}
	

}
