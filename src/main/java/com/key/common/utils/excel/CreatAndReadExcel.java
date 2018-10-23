package com.key.common.utils.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 可以从http://poi.apache.org/ 这里下载到POI的jar包 POI 
创建和读取2003-2007版本Excel文件
 * 
 */

public class CreatAndReadExcel {

	public static void main(String[] args) throws Exception {

		creat2003Excel();// 创建2007版Excel文件
        creat2007Excel();// 创建2003版Excel文件
		//读取2003Excel文件
		String path2003 = System.getProperty("user.dir") + System.getProperty("file.separator") + "style_2003.xls";// 获取项目文件路径2003版文件名
		System.out.println("路径：" + path2003);
		File f2003 = new File(path2003);
		try {
			readExcel(f2003);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //读取2007Excel文件
		String path2007 = System.getProperty("user.dir") + System.getProperty("file.separator") + "style_2007.xlsx";// 获取项目文件路径+2007版文件名
		System.out.println("路径：" + path2007);
		File f2007 = new File(path2007);
		try {
			readExcel(f2007);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 创建2007版Excel文件
	 * 
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	private static void creat2007Excel() throws FileNotFoundException,
			IOException {
		// HSSFWorkbook workBook = new HSSFWorkbook();// 创建 一个excel文档对象
		XSSFWorkbook workBook = new XSSFWorkbook();
		XSSFSheet sheet = workBook.createSheet();// 创建一个工作薄对象
		sheet.setColumnWidth(1, 10000);// 设置第二列的宽度为
		XSSFRow row = sheet.createRow(1);// 创建一个行对象
		row.setHeightInPoints(23);// 设置行高23像素
		XSSFCellStyle style = workBook.createCellStyle();// 创建样式对象
		// 设置字体
		XSSFFont font = workBook.createFont();// 创建字体对象
		font.setFontHeightInPoints((short) 15);// 设置字体大小
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 设置粗体
		font.setFontName("黑体");// 设置为黑体字
		style.setFont(font);// 将字体加入到样式对象
		// 设置对齐方式
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);// 水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
		// 设置边框
		style.setBorderTop(HSSFCellStyle.BORDER_THICK);// 顶部边框粗线
		style.setTopBorderColor(HSSFColor.RED.index);// 设置为红色
		style.setBorderBottom(HSSFCellStyle.BORDER_DOUBLE);// 底部边框双线
		style.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);// 左边边框
		style.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);// 右边边框
		// 格式化日期
		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));
		XSSFCell cell = row.createCell(1);// 创建单元格
		cell.setCellValue(new Date());// 写入当前日期
		cell.setCellStyle(style);// 应用样式对象


		// 文件输出流

		FileOutputStream os = new FileOutputStream("style_2007.xlsx");

		workBook.write(os);// 将文档对象写入文件输出流

		os.close();// 关闭文件输出流
		System.out.println("创建成功 office 2007 excel");
	}

	/**
	 * 创建2003版本的Excel文件
	 */
	private static void creat2003Excel() throws FileNotFoundException,
			IOException {
		HSSFWorkbook workBook = new HSSFWorkbook();// 创建 一个excel文档对象

		HSSFSheet sheet = workBook.createSheet();// 创建一个工作薄对象

		sheet.setColumnWidth(1, 10000);// 设置第二列的宽度为

		HSSFRow row = sheet.createRow(1);// 创建一个行对象

		row.setHeightInPoints(23);// 设置行高23像素

		HSSFCellStyle style = workBook.createCellStyle();// 创建样式对象

		// 设置字体

		HSSFFont font = workBook.createFont();// 创建字体对象

		font.setFontHeightInPoints((short) 15);// 设置字体大小

		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 设置粗体

		font.setFontName("黑体");// 设置为黑体字

		style.setFont(font);// 将字体加入到样式对象

		// 设置对齐方式

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);// 水平居中

		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中

		// 设置边框

		style.setBorderTop(HSSFCellStyle.BORDER_THICK);// 顶部边框粗线

		style.setTopBorderColor(HSSFColor.RED.index);// 设置为红色

		style.setBorderBottom(HSSFCellStyle.BORDER_DOUBLE);// 底部边框双线

		style.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);// 左边边框

		style.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);// 右边边框

		// 格式化日期

		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));

		HSSFCell cell = row.createCell(1);// 创建单元格

		cell.setCellValue(new Date());// 写入当前日期

		cell.setCellStyle(style);// 应用样式对象

		// 文件输出流

		FileOutputStream os = new FileOutputStream("style_2003.xls");

		workBook.write(os);// 将文档对象写入文件输出流

		os.close();// 关闭文件输出流
		System.out.println("创建成功 office 2003 excel");
	}

	/**
	 * 对外提供读取excel 的方法
	 */
	public static List<List<Object>> readExcel(File file) throws IOException {
		String fileName = file.getName();
		String extension = fileName.lastIndexOf(".") == -1 ? "" : fileName
				.substring(fileName.lastIndexOf(".") + 1);
		if ("xls".equals(extension)) {
			return read2003Excel(file);
		} else if ("xlsx".equals(extension)) {
			return read2007Excel(file);
		} else {
			throw new IOException("不支持的文件类型");
		}
	}

	/**
	 * 读取 office 2003 excel
	 * 
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	private static List<List<Object>> read2003Excel(File file)
			throws IOException {
		List<List<Object>> list = new LinkedList<List<Object>>();
		HSSFWorkbook hwb = new HSSFWorkbook(new FileInputStream(file));
		HSSFSheet sheet = hwb.getSheetAt(0);
		Object value = null;
		HSSFRow row = null;
		HSSFCell cell = null;
		System.out.println("读取office 2003 excel内容如下：");
		for (int i = sheet.getFirstRowNum(); i <= sheet
				.getPhysicalNumberOfRows(); i++) {
			row = sheet.getRow(i);
			if (row == null) {
				continue;
			}
			List<Object> linked = new LinkedList<Object>();
			for (int j = row.getFirstCellNum(); j <= row.getLastCellNum(); j++) {
				cell = row.getCell(j);
				if (cell == null) {
					continue;
				}
				DecimalFormat df = new DecimalFormat("0");// 格式化 number String
				// 字符
				SimpleDateFormat sdf = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");// 格式化日期字符串
				DecimalFormat nf = new DecimalFormat("0.00");// 格式化数字
				switch (cell.getCellType()) {
				case XSSFCell.CELL_TYPE_STRING:
					// System.out.println(i + "行" + j + " 列 is String type");
					value = cell.getStringCellValue();
					System.out.print("  " + value + "  ");
					break;
				case XSSFCell.CELL_TYPE_NUMERIC:
					// System.out.println(i + "行" + j
					// + " 列 is Number type ; DateFormt:"
					// + cell.getCellStyle().getDataFormatString());
					if ("@".equals(cell.getCellStyle().getDataFormatString())) {
						value = df.format(cell.getNumericCellValue());

					} else if ("General".equals(cell.getCellStyle()
							.getDataFormatString())) {
						value = nf.format(cell.getNumericCellValue());
					} else {
						value = sdf.format(HSSFDateUtil.getJavaDate(cell
								.getNumericCellValue()));
					}
					System.out.print("  " + value + "  ");
					break;
				case XSSFCell.CELL_TYPE_BOOLEAN:
					// System.out.println(i + "行" + j + " 列 is Boolean type");
					value = cell.getBooleanCellValue();
					System.out.print("  " + value + "  ");
					break;
				case XSSFCell.CELL_TYPE_BLANK:
					// System.out.println(i + "行" + j + " 列 is Blank type");
					value = "";
					System.out.print("  " + value + "  ");
					break;
				default:
					// System.out.println(i + "行" + j + " 列 is default type");
					value = cell.toString();
					System.out.print("  " + value + "  ");
				}
				if (value == null || "".equals(value)) {
					continue;
				}
				linked.add(value);

			}
			System.out.println("");
			list.add(linked);
		}

		return list;
	}

	/**
	 * 读取Office 2007 excel
	 */

	private static List<List<Object>> read2007Excel(File file)
			throws IOException {

		List<List<Object>> list = new LinkedList<List<Object>>();
		// String path = System.getProperty("user.dir") +
		// System.getProperty("file.separator")+"dd.xlsx";
		// System.out.println("路径："+path);
		// 构造 XSSFWorkbook 对象，strPath 传入文件路径
		XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(file));

		// 读取第一章表格内容
		XSSFSheet sheet = xwb.getSheetAt(0);
		Object value = null;
		XSSFRow row = null;
		XSSFCell cell = null;
		System.out.println("读取office 2007 excel内容如下：");
		for (int i = sheet.getFirstRowNum(); i <= sheet
				.getPhysicalNumberOfRows(); i++) {
			row = sheet.getRow(i);
			if (row == null) {
				continue;
			}
			List<Object> linked = new LinkedList<Object>();
			for (int j = row.getFirstCellNum(); j <= row.getLastCellNum(); j++) {
				cell = row.getCell(j);
				if (cell == null) {
					continue;
				}
				DecimalFormat df = new DecimalFormat("0");// 格式化 number String
				// 字符
				SimpleDateFormat sdf = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");// 格式化日期字符串
				DecimalFormat nf = new DecimalFormat("0.00");// 格式化数字

				switch (cell.getCellType()) {
				case XSSFCell.CELL_TYPE_STRING:
					// System.out.println(i + "行" + j + " 列 is String type");
					value = cell.getStringCellValue();
					System.out.print("  " + value + "  ");
					break;
				case XSSFCell.CELL_TYPE_NUMERIC:
					// System.out.println(i + "行" + j
					// + " 列 is Number type ; DateFormt:"
					// + cell.getCellStyle().getDataFormatString());
					if ("@".equals(cell.getCellStyle().getDataFormatString())) {
						value = df.format(cell.getNumericCellValue());

					} else if ("General".equals(cell.getCellStyle()
							.getDataFormatString())) {
						value = nf.format(cell.getNumericCellValue());
					} else {
						value = sdf.format(HSSFDateUtil.getJavaDate(cell
								.getNumericCellValue()));
					}
					System.out.print("  " + value + "  ");
					break;
				case XSSFCell.CELL_TYPE_BOOLEAN:
					// System.out.println(i + "行" + j + " 列 is Boolean type");
					value = cell.getBooleanCellValue();
					System.out.print("  " + value + "  ");
					break;
				case XSSFCell.CELL_TYPE_BLANK:
					// System.out.println(i + "行" + j + " 列 is Blank type");
					value = "";
					// System.out.println(value);
					break;
				default:
					// System.out.println(i + "行" + j + " 列 is default type");
					value = cell.toString();
					System.out.print("  " + value + "  ");
				}
				if (value == null || "".equals(value)) {
					continue;
				}
				linked.add(value);
			}
			System.out.println("");
			list.add(linked);
		}
		return list;
	}
}
