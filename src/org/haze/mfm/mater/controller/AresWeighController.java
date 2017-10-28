package org.haze.mfm.mater.controller;

import java.util.List;

import javax.annotation.Resource;

import org.haze.base.util.JsonUtil;
import org.haze.mfm.mater.dao.AresWeighDao;
import org.haze.mfm.mater.model.AresWeigh;
import org.haze.mfm.mater.model.CheciHB;
import org.haze.mfm.mater.model.Pkxx;
import org.haze.mfm.mater.service.AresWeighService;
import org.haze.mfm.mater.service.CheciHBService;
import org.haze.mfm.mater.service.PkxxService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 程序名称：CheciHBController
 * 程序说明：车次合并
 * 版权信息:
 * 时间：2017年10月20日 上午11:52:01
 * @author 鲁彬
 */
@Controller
@RequestMapping("/AresWeigh/")
public class AresWeighController {
	public static String ARESWEIGH_LIST = "gresource/mfm/mater/checiHB/checiHB.jsp";
	public static String PEIKUANG_LIST = "gresource/mfm/mater/checiHB/pkHB.jsp";
	public static String PEIKUANG_NEW_LIST = "gresource/mfm/mater/checiHB/PkNew.jsp";

	
	@Resource
	private AresWeighService aresWeighService;
	
	@Resource
	private AresWeighDao aresWeighDao;
	
	@Resource
	private CheciHBService checiHBService;
	
	@Resource
	private PkxxService pkxxService;
	
	@RequestMapping("list")
	public ModelAndView list(AresWeigh aresWeigh, ModelMap modelMap){
		return new ModelAndView(AresWeighController.ARESWEIGH_LIST, modelMap);
	}
	
	@RequestMapping("pklist")
	public ModelAndView pklist(AresWeigh aresWeigh, ModelMap modelMap){
		return new ModelAndView(AresWeighController.PEIKUANG_LIST, modelMap);
	}
	
	
	@RequestMapping("getList")
	@ResponseBody
	public Object getList(AresWeigh aresWeigh) throws Exception{
		//System.out.println(aresWeigh.getAresName());
		return aresWeighService.easyUIJson(aresWeigh, aresWeigh.getPageBean());
	}
	
	@RequestMapping("hebingAres")
	@ResponseBody
	public void hebingAres(AresWeigh aresWeigh,ModelMap modelMap) throws Exception{
		List<AresWeigh> aresWeighList = JsonUtil.fromJson(aresWeigh.getCheciJson(),List.class,AresWeigh.class);//将车次 信息转化为list
		List<AresWeigh> aList = aresWeighService.select(aresWeigh);//根据区域名选出区域，alist的长度为1
		AresWeigh a = aList.get(0);
		float jingzhong = Float.parseFloat(a.getJingzhong())+Float.parseFloat(aresWeigh.getJingzhong());
		aresWeigh.setJingzhong(jingzhong+"");
		
//		System.out.println(aresWeigh.getJingzhong());
		aresWeighService.update(aresWeigh);
		for(AresWeigh aw : aresWeighList){
			if(aw.getAresName().equals(aresWeigh.getAresName())){
				//如果在列表中的区域信息的区域名和aresWeigh的区域名相同，说明这个区域是几个区域的合区域，
				//也就是其他区域中的矿石添加到了这个区域，这个区域需要将信息修改，其他区域需要把信息清零
			}
			else{
				aw.setJingzhong("0");//将区域的重量清零并更新  aw是旧区域，aresWeigh是新区域
				aresWeighService.update(aw);
				
				CheciHB cchb = new CheciHB();
				cchb.setAresName(aw.getAresName());
				
				List<CheciHB> list = checiHBService.select(cchb);
				for(int i = 0;i<list.size();i++){
					
					cchb.setId(list.get(i).getId());
					cchb.setAresName(aresWeigh.getAresName());
					checiHBService.update(cchb);//将车次信息改为新区域
				}
			}
		}		
	}
	
	@RequestMapping("checiNew")
	public ModelAndView checiNew(AresWeigh pkxx,ModelMap modelMap) throws Exception{
		
//		aresWeigh = aresWeighService.selectOne(aresWeigh.getId());
		System.out.println(pkxx.getCheciJson());
		Pkxx p = pkxxService.selectOne(pkxx.getId());
		modelMap.put("pkxx", pkxx);
		return new ModelAndView(AresWeighController.PEIKUANG_NEW_LIST, modelMap);
	}
}
