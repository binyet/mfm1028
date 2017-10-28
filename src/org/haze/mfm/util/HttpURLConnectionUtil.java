package org.haze.mfm.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Properties;
/**
 * 
 * 程序名称：HttpURLConnectionUtil 
 * 程序说明：HttpURLConnection工具类
 * 版权信息:山东金软科技股份有限公司
 * 时间：2016年5月30日 下午2:24:06
 * @author 王亚茹
 */
public class HttpURLConnectionUtil {
	public static  String URL = "";
	private static final String PATH = "resources/jdbc.properties";
	
	/**
	 * 获取url
	 * @return
	 */
	public static String getUrl() {
		  Properties prop = new Properties();     
		  try {
			 //读取属性文件 "/resources/jdbc.properties"
            InputStream in = new FileInputStream(HttpURLConnectionUtil.class.getClassLoader().getResource(PATH).getPath());
            prop.load(in);     //加载属性列表
            URL = prop.getProperty("interfaceUrl");
           in.close();
           
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		  return URL;
	}
	
/**
  * 接口调用 GET   方法可能不能用
  */
 public static String httpURLConectionGET(String urlName) {
	 String ret = null;
     try {
         URL url = new URL(getUrl()+urlName);    // 把字符串转换为URL请求地址
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();// 打开连接
        connection.connect();// 连接会话
        // 获取输入流
        BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
         String line;
         StringBuilder sb = new StringBuilder();
         while ((line = br.readLine()) != null) {// 循环读取流
            sb.append(line);
         }
         ret = sb.toString();
         br.close();// 关闭流
        connection.disconnect();// 断开连接
     } catch (Exception e) {
         e.printStackTrace();
         System.out.println("失败!");
     }
     return ret;
 }
 
 /**
  * 接口调用  POST
  */
 public static String httpURLConnectionPOST (String urlName,Map<String, String> map) {
	 String ret = null;
     try {
	         URL url = new URL(getUrl()+urlName); // 把字符串转换为URL请求地址
	         // 将url 以 open方法返回的urlConnection  连接强转为HttpURLConnection连接  (标识一个url所引用的远程对象连接)
	         HttpURLConnection connection = (HttpURLConnection) url.openConnection();// 此时cnnection只是为一个连接对象,待连接中
	        
	         // 设置连接输出流为true,默认false (post 请求是以流的方式隐式的传递参数)
	         connection.setDoOutput(true);
	         
	         // 设置连接输入流为true
	         connection.setDoInput(true);
	         
	         // 设置请求方式为post
	         connection.setRequestMethod("POST");
	         
	         // post请求缓存设为false
	         connection.setUseCaches(false);
	         
	         // 设置该HttpURLConnection实例是否自动执行重定向
	        connection.setInstanceFollowRedirects(true);
	         
	         // 设置请求头里面的各个属性 (以下为设置内容的类型,设置为经过urlEncoded编码过的from参数)
	         // application/x-javascript text/xml->xml数据 application/x-javascript->json对象 application/x-www-form-urlencoded->表单数据
	        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	         
	         // 建立连接 (请求未开始,直到connection.getInputStream()方法调用时才发起,以上各个参数设置需在此方法之前进行)
	         connection.connect();
	         
	         // 创建输入输出流,用于往连接里面输出携带的参数,(输出内容为?后面的内容)
	         DataOutputStream dataout = new DataOutputStream(connection.getOutputStream());
	         StringBuffer stb = new StringBuffer();
	         if(null != map && !map.isEmpty()){
	        	 for (String key : map.keySet()) {
	        		 stb.append(key+"="+URLEncoder.encode(map.get(key), "utf-8")+"&");
				}
	         }
	        String param = stb.toString();
	//         String parm = "storeId=" + URLEncoder.encode("32", "utf-8"); //URLEncoder.encode()方法  为字符串进行编码
	        
	         // 将参数输出到连接
	        dataout.writeBytes(param.substring(0, param.length()-1));
	         
	         // 输出完成后刷新并关闭流
	        dataout.flush();
	         dataout.close(); // 重要且易忽略步骤 (关闭流,切记!) 
	         
	//         System.out.println(connection.getResponseCode());
	         
	         // 连接发起请求,处理服务器响应  (从连接获取到输入流并包装为bufferedReader)
	         BufferedReader bf = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8")); 
	         String line =  bf.readLine();
//	         StringBuilder sb = new StringBuilder(); // 用来存储响应数据
	         // 循环读取流,若不到结尾处
//	        while ((line = bf.readLine()) != null) {
//	             sb.append(bf.readLine());
//	         }
	         if(line != null){
	        	 ret = line;
	         }
	         bf.close();    // 重要且易忽略步骤 (关闭流,切记!) 
	         connection.disconnect(); // 销毁连接
	 
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     return ret;
	 }
 
// public static void main(String[] args) {
//	 Map<String, String> map = new HashMap<String, String>();
//		map.put("meterDate_Str", "2016-06-15");
//		map.put("cbId", "XD");
//		map.put("checi", "2798");
//		map.put("mine", "1");
//	String ret = httpURLConnectionPOST("MapController/InterfaceCheciGetNotCallback.haze", map);
//	System.out.println(ret);
//}
}