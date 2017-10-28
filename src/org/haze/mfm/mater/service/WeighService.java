package org.haze.mfm.mater.service;


import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.haze.base.dao.AbsDao;
import org.haze.base.service.AbsService;
import org.haze.base.util.DateUtil;
import org.haze.mfm.mater.dao.WeighDao;
import org.haze.mfm.mater.model.Weigh;
import org.haze.mfm.util.ExportExcel;
import org.springframework.stereotype.Service;

/**
 * 
 * 程序名称：WeighService 
 * 程序说明：过磅称重的维护
 * 版权信息:山东金软科技股份有限公司
 * 时间：2017年10月15日 下午2:26:48
 * @author 鲁彬
 */
@Service
public class WeighService extends AbsService<Weigh>{

	@Resource
	private WeighDao weighDao;

	@Override
	protected AbsDao<Weigh> getEntityDao() {
		// TODO Auto-generated method stub
		
		return weighDao;
	}
	

	/**
	 * 导出excel-品位
	 * @param sampleTasteReport
	 * @param response
	 * @throws Exception
	 */
	public void toTasteQueryExcelTaste(Weigh weigh, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		List<Weigh> list = weighDao.select("select", weigh);
		String fileName = "金翅岭金矿化验报告单";
		response.reset();  
		response.setHeader("Content-Disposition", "attachment;filename="  
					+ URLEncoder.encode(fileName, "utf-8") + "-" + DateUtil.getString(new Date(), "yyyyMMddHHmmss") + ".xls");// 指定下载的文件名  
		response.setContentType("application/vnd.ms-excel");  
		response.setHeader("Pragma", "no-cache");  
		response.setHeader("Cache-Control", "no-cache");  
		response.setDateHeader("Expires", 0);  
		OutputStream output = response.getOutputStream();  
		BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);  
		
		// 定义单元格报头  
		String worksheetTitle = fileName;
		HSSFWorkbook wb = new HSSFWorkbook();

		HSSFSheet sheet = wb.createSheet();  
		ExportExcel exportExcel = new ExportExcel(wb, sheet); 
		// 工作表名  名称，合并开始行，合并结束行，合并开始列，合并结束列  :列分隔符 ;行分隔符
		StringBuffer headNamess = new StringBuffer();
		headNamess.append("性质,1,1,0,0").append(": ")
					.append("来源,1,1,1,1").append(":")
					.append("客户,1,1,2,2").append(":")
					.append("车号,1,1,3,3").append(":")
					.append("司机,1,1,4,4").append(":")
					.append("车次,1,1,5,5").append(":")
					.append("毛重(t),1,1,6,6").append(":")
					.append("皮重(t),1,1,7,7").append(":")
					.append("净重(t),1,1,8,8").append(":")
					.append("过磅人,1,1,9,9").append(":")
					.append("审核人,1,1,10,10").append(":")
					.append("时间,1,1,11,11");
		exportExcel.createZdyColumHeader(headNamess.toString());
		
		sheet.setColumnWidth(0, 2000);//性质
		sheet.setColumnWidth(1, 5000);//来源
		sheet.setColumnWidth(2, 3500);//客户
		sheet.setColumnWidth(3, 3500);//车号
		sheet.setColumnWidth(4, 3000);//司机
		sheet.setColumnWidth(5, 3000);//车次
		sheet.setColumnWidth(6, 3000);//毛重
		sheet.setColumnWidth(7, 3000);//皮重
		sheet.setColumnWidth(8, 3000);//净重
		sheet.setColumnWidth(9, 3000);//过磅人
		sheet.setColumnWidth(10, 3000);//审核人
		sheet.setColumnWidth(11, 6000);//时间
		
		// 创建报表头部  
		exportExcel.createNormalHead(worksheetTitle, 6);  
		//定义数据行  
		HSSFRow row = sheet.createRow(2); 
		HSSFCell cell = row.createCell(1);  
		StringBuilder sb = null;
		for (int i = 0; i < list.size(); i++) {  
			row = sheet.createRow(i + 2);
//			WeighReport wt = list.get(i);
//			String t[] = new String[]{
//				wt.getProperty(),wt.getSource(),wt.getClient(),wt.getCarNum(),wt.getDriver(),
//				wt.getCheci(), wt.getMaozhong(), wt.getPizhong(), wt.getJingzhong(), 
//				wt.getWeigher(), wt.getAuditor(), wt.getWeighDate()
//					
//			};
//			for(int j=0;j<t.length;j++){
//				cell = row.createCell(j);
//				cell.setCellValue(t[i]);
//			}
//			row.createCell(11).setCellValue(date);
			sb = new StringBuilder();
			sb.append(list.get(i).getProperty()).append(":")
				.append(list.get(i).getSource()).append(":")
				.append(list.get(i).getClient()).append(":")
				.append(list.get(i).getCarNum()).append(":")
				.append(list.get(i).getDriver()).append(":")
				.append(list.get(i).getCheci()).append(":")
				.append(list.get(i).getMaozhong()).append(":")
				.append(list.get(i).getPizhong()).append(":")
				.append(list.get(i).getJingzhong()).append(":")
				.append(list.get(i).getWeigher()).append(":")
				.append(list.get(i).getAuditor() != null ? list.get(i).getAuditor() : " ");
			
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		    Date date = sdf.parse(list.get(i).getWeighDate()); 
		    row.createCell(11).setCellValue(list.get(i).getWeighDate());
			String[] tabValue = sb.toString().split("\\:");
			for(int x = 0 ; x < tabValue.length ; x++){
				cell = row.createCell(x);  
				
				HSSFCellStyle cellStyle = wb.createCellStyle();  
				// 指定单元格居中对齐  
				cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				if(x == 1 || x == 2){
					cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
				}
				if(x >= 3){
					cellStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
				}
				
				
				//设置单元格边框
				cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
				cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
				cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				// 指定单元格垂直居中对齐  
				cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
				// 指定当单元格内容显示不下时自动换行  
				cellStyle.setWrapText(true);  
				HSSFFont cellFont = wb.createFont();  
				cellFont.setFontName("宋体"); 
				cellStyle.setFont(cellFont);
				cell.setCellStyle(cellStyle);  
				cell.setCellValue(new HSSFRichTextString(tabValue[x]));  
			}
		}
		
		bufferedOutPut.flush();  
		wb.write(bufferedOutPut);  
		bufferedOutPut.close();  
		list.clear();
	}

}
