package org.haze.mfm.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPrintSetup;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 * 
 * 程序名称：ExportExcel.java
 * 程序说明：EXCEL报表工具类.
 * 版权信息： Copyright 山东金软科技有限公司
 * 时间：2014-7-15 上午10:03:15
 * @author 夏会冬
 * @version ver 0.1
 */
public class ExportExcel {

	private HSSFWorkbook wb = null;
	private HSSFSheet sheet = null;

	/**
	 * @param wb
	 * @param sheet 
	 */
	public ExportExcel(HSSFWorkbook wb, HSSFSheet sheet) {
		// super();
		this.wb = wb;
		this.sheet = sheet;
		HSSFPrintSetup ps = sheet.getPrintSetup();    
		ps.setLandscape(true); // 打印方向，true：横向，false：纵向(默认)     

	}

	/**
	 * 创建通用EXCEL头部
	 * 
	 * @param headString
	 *            头部显示的字符
	 * @param colSum
	 *            该报表的列数
	 */
	@SuppressWarnings( "deprecation" )
	public void createNormalHead(String headString, int colSum) {
		HSSFRow row = sheet.createRow(0);
		// 设置第一行
		HSSFCell cell = row.createCell(0);
		 row.setHeight((short) 700);

		// 定义单元格为字符串类型
		cell.setCellType(HSSFCell.ENCODING_UTF_16);// 中文处理
		cell.setCellValue(new HSSFRichTextString(headString));

		// 指定合并区域
		/**
		 * public Region(int rowFrom, short colFrom, int rowTo, short colTo)
		 */
		sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) colSum));

		// 定义单元格格式，添加单元格表样式，并添加到工作簿
		HSSFCellStyle cellStyle = wb.createCellStyle();
		// 设置单元格水平对齐类型
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_BOTTOM);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行

		// 设置单元格字体
		HSSFFont font = wb.createFont();
		 font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		 font.setFontName("宋体");
		 font.setFontHeight((short) 360);
		 cellStyle.setFont(font);
		cell.setCellStyle(cellStyle);
	}
	@SuppressWarnings( "deprecation" )
	public void createNormalHead(String headString, int colSum,String fontName,short alignment) {
		HSSFRow row = sheet.createRow(0);
		// 设置第一行
		HSSFCell cell = row.createCell(0);
		 row.setHeight((short) 500);

		// 定义单元格为字符串类型
		cell.setCellType(HSSFCell.ENCODING_UTF_16);// 中文处理
		cell.setCellValue(new HSSFRichTextString(headString));

		// 指定合并区域
		/**
		 * public Region(int rowFrom, short colFrom, int rowTo, short colTo)
		 */
		sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) colSum));

		// 定义单元格格式，添加单元格表样式，并添加到工作簿
		HSSFCellStyle cellStyle = wb.createCellStyle();
		// 设置单元格水平对齐类型
		cellStyle.setAlignment(alignment); // 指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_BOTTOM);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行

		// 设置单元格字体
		HSSFFont font = wb.createFont();
		 //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		 font.setFontName(fontName);
		 font.setFontHeight((short) 350);
		 cellStyle.setFont(font);
		cell.setCellStyle(cellStyle);
	}
	/**
	 * 创建通用报表第二行
	 * 
	 * @param params
	 *            统计条件数组
	 * @param colSum
	 *            需要合并到的列索引
	 */
	@SuppressWarnings("deprecation")
	public void createNormalTwoRow(String[] params, int colSum) {
		// 创建第二行
		HSSFRow row1 = sheet.createRow(1);

		row1.setHeight((short) 400);

		HSSFCell cell2 = row1.createCell(0);

		cell2.setCellType(HSSFCell.ENCODING_UTF_16);
		cell2.setCellValue(new HSSFRichTextString("时间：" + params[0] + "至"
				+ params[1]));

		// 指定合并区域
		/**
		 * public Region(int rowFrom, short colFrom, int rowTo, short colTo)
		 */
		sheet.addMergedRegion(new Region(1, (short) 0, 1, (short) colSum));

		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行

		// 设置单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeight((short) 250);
		cellStyle.setFont(font);

		cell2.setCellStyle(cellStyle);
	}

	/**
	 * 设置报表标题
	 * 
	 * @param columHeader
	 *            标题字符串数组
	 */
	public void createColumHeader(String[] columHeader) {

		// 设置列头 在第三行
		HSSFRow row2 = sheet.createRow(2);

		// 指定行高
		row2.setHeight((short) 600);

		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行

		// 单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeight((short) 250);
		cellStyle.setFont(font);

		// 设置单元格背景色
		cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

		HSSFCell cell3 = null;

		for (int i = 0; i < columHeader.length; i++) {
			cell3 = row2.createCell(i);
			cell3.setCellType(HSSFCell.ENCODING_UTF_16);
			cell3.setCellStyle(cellStyle);
			cell3.setCellValue(new HSSFRichTextString(columHeader[i]));
		}
	}

	
	/**
	 * 自定义报表标题
	 * @param columHeaders
	 * 				表名及合并
	 * 		名称，合并开始行，合并结束行，合并开始列，合并结束列  :列分隔符 ;行分隔符
	 */
	public void createZdyColumHeader(String columHeaders) {
		String[] columHeaderss = columHeaders.split("\\;");
		for(int i = 0 ; i < columHeaderss.length ; i++ ){
			//定义行
			HSSFRow row = sheet.createRow(i+1);
			//设置行高
			row.setHeight((short) 300);
			//设置表格格式
			HSSFCellStyle cellStyle = wb.createCellStyle();
			cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
			cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
			cellStyle.setWrapText(true);// 指定单元格自动换行
			//设置单元格边框
			cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
			cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			// 设置单元格背景色
//			cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
//			cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			// 单元格字体
			HSSFFont font = wb.createFont();
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			font.setFontName("宋体");
			font.setFontHeight((short) 250);
			cellStyle.setFont(font);
			
			HSSFCell cell = null;
			String[] columHeader = columHeaderss[i].split("\\:");
			for (int x = 0; x < columHeader.length; x++) {
				cell = row.createCell(x);
				cell.setCellType(HSSFCell.ENCODING_UTF_16);
				cell.setCellStyle(cellStyle);
				if(columHeader[x].contains(",")){
					String[] headerName = columHeader[x].split("\\,");
					// 合并 合并开始行、合并结束行、合并开始列、合并结束列
					sheet.addMergedRegion(new CellRangeAddress(Integer.valueOf(headerName[1]),Integer.valueOf(headerName[2]),
							Integer.valueOf(headerName[3]),Integer.valueOf(headerName[4])));// 指定合并区域
					cell.setCellValue(new HSSFRichTextString(headerName[0]));
				}
				
			}
			
		}
		
	}
	
	/**
	 * 创建内容单元格
	 * 
	 * @param wb
	 *            HSSFWorkbook
	 * @param row
	 *            HSSFRow
	 * @param col
	 *            short型的列索引
	 * @param align
	 *            对齐方式
	 * @param val
	 *            列值
	 */
	public void cteateCell(HSSFWorkbook wb, HSSFRow row, int col, short align,
			String val) {
		HSSFCell cell = row.createCell(col);
		cell.setCellType(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue(new HSSFRichTextString(val));
		HSSFCellStyle cellstyle = wb.createCellStyle();
		cellstyle.setAlignment(align);
		cell.setCellStyle(cellstyle);
		
	}

	/**
	 * 创建合计行
	 * 
	 * @param colSum
	 *            需要合并到的列索引
	 * @param cellValue
	 */
	public void createLastSumRow(int colSum, String[] cellValue) {

		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行
		//设置单元格边框
		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		// 单元格字体
		HSSFFont font = wb.createFont();
		//font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeight((short) 200);
		cellStyle.setFont(font);
		// 获取工作表最后一行
		HSSFRow lastRow = sheet.createRow((short) (sheet.getLastRowNum() + 1));
//		lastRow.setHeight((short) 250);
		HSSFCell sumCell = lastRow.createCell(0);
		
		sumCell.setCellValue(new HSSFRichTextString("合计"));
		sumCell.setCellStyle(cellStyle);
		// 合并 最后一行的第零列-最后一行的第一列
		sheet.addMergedRegion(new CellRangeAddress(sheet.getLastRowNum(),sheet.getLastRowNum(),0,colSum));// 指定合并区域

		for (int i = 1; i < (cellValue.length + 1); i++) {
			// 定义最后一行的第三列
			sumCell = lastRow.createCell(i);
			sumCell.setCellStyle(cellStyle);
			// 定义数组 从0开始。
			sumCell.setCellValue(new HSSFRichTextString(cellValue[i - 1]));
		}
	}
	public void createLastSumRow(int colSum, String[] cellValue,String fontName) {

		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行
		//设置单元格边框
		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		// 单元格字体
		HSSFFont font = wb.createFont();
		//font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName(fontName);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontHeight((short) 200);
		cellStyle.setFont(font);
		// 获取工作表最后一行
		HSSFRow lastRow = sheet.createRow((short) (sheet.getLastRowNum() + 1));
//		lastRow.setHeight((short) 250);
		HSSFCell sumCell = lastRow.createCell(0);
		
		sumCell.setCellValue(new HSSFRichTextString("合计"));
		sumCell.setCellStyle(cellStyle);
		// 合并 最后一行的第零列-最后一行的第一列
		sheet.addMergedRegion(new CellRangeAddress(sheet.getLastRowNum(),sheet.getLastRowNum(),0,colSum));// 指定合并区域

		for (int i = 1; i < (cellValue.length + 1); i++) {
			// 定义最后一行的第三列
			sumCell = lastRow.createCell(i);
			sumCell.setCellStyle(cellStyle);
			// 定义数组 从0开始。
			sumCell.setCellValue(new HSSFRichTextString(cellValue[i - 1]));
		}
	}
	/**
	 * 创建自定义行
	 * @param staCol 合并开始列
	 * @param endCol 合并结束列
	 * @param fontSize 单元格字体大小
	 * @param rowNm  需空出的行数
	 * @param cellValue 需显示的字符串
	 */
	@SuppressWarnings("deprecation")
	public void createLastZdyRow(int rowNm, int staCol, int endCol, int fontSize,short hssfont, String cellValue) {

		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT); // 指定单元格居左对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行

		// 单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(hssfont);
		font.setFontName("宋体");
		font.setFontHeight((short) fontSize);
		cellStyle.setFont(font);
		
		// 获取工作表最后一行
		HSSFRow lastRow = sheet.createRow((short) (sheet.getLastRowNum() + rowNm));
		// 指定行高
		lastRow.setHeight((short) (fontSize + 50));
		String[] cellVal = cellValue.split("\\,");
		for(int i = 0 ; i < cellVal.length ; i++){
			HSSFCell sumCell = lastRow.createCell(staCol);
			sumCell.setCellValue(new HSSFRichTextString(cellVal[i]));
			sumCell.setCellStyle(cellStyle);
			// 合并 指定行的开始列-指定行的结束列
			sheet.addMergedRegion(new Region(sheet.getLastRowNum() , (short) staCol,
					sheet.getLastRowNum() , (short) endCol));// 指定合并区域
			staCol = staCol + endCol + 1;
			endCol = staCol + endCol;
		}
		
	}
	@SuppressWarnings("deprecation")
	public void createLastZdyRow(int rowNm, int staCol, int endCol, int fontSize,short hssfont, String cellValue,String fontName) {

		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT); // 指定单元格居左对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行

		// 单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(hssfont);
		font.setFontName(fontName);
		font.setFontHeight((short) fontSize);
		cellStyle.setFont(font);
		
		// 获取工作表最后一行
		HSSFRow lastRow = sheet.createRow((short) (sheet.getLastRowNum() + rowNm));
		// 指定行高
		lastRow.setHeight((short) (fontSize + 50));
		String[] cellVal = cellValue.split("\\,");
		for(int i = 0 ; i < cellVal.length ; i++){
			HSSFCell sumCell = lastRow.createCell(staCol);
			sumCell.setCellValue(new HSSFRichTextString(cellVal[i]));
			sumCell.setCellStyle(cellStyle);
			// 合并 指定行的开始列-指定行的结束列
			sheet.addMergedRegion(new Region(sheet.getLastRowNum() , (short) staCol,
					sheet.getLastRowNum() , (short) endCol));// 指定合并区域
			staCol = staCol + endCol + 1;
			endCol = staCol + endCol;
		}
		
	}

	/**
	 * 输入EXCEL文件
	 * 
	 * @param fileName
	 *            文件名
	 */
	public void outputExcel(String fileName) {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(new File(fileName));
			wb.write(fos);
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @return the sheet
	 */
	public HSSFSheet getSheet() {
		return sheet;
	}

	/**
	 * @param sheet
	 *            the sheet to set
	 */
	public void setSheet(HSSFSheet sheet) {
		this.sheet = sheet;
	}

	/**
	 * @return the wb
	 */
	public HSSFWorkbook getWb() {
		return wb;
	}

	/**
	 * @param wb
	 *            the wb to set
	 */
	public void setWb(HSSFWorkbook wb) {
		this.wb = wb;
	}
}