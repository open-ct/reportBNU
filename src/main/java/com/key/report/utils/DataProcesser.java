package com.key.report.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Created by heweiqiang on 2018/12/25.
 */
public class DataProcesser {
    private static final Logger LOGGER = LoggerFactory.getLogger(DataProcesser.class);

    public static String readData(String reportId) {
        String filePath = "files/reportHtml/";
        filePath = filePath.replace("/", File.separator);
        filePath = filePath.replace("\\", File.separator);
        String fileName = reportId + ".data";
        ServletContext sc = ServletActionContext.getServletContext();
        filePath = sc.getRealPath("/") + filePath;
        File file2 = new File(filePath);
        if (!file2.exists() || !file2.isDirectory()) return null;
        File file = new File(filePath + fileName);
        if (!file.exists()) return null;
        String data = "";
        try {
            BufferedReader in = new BufferedReader(new FileReader(file));
            data = in.readLine();
            in.close();
        } catch (IOException e) {
            LOGGER.error("Read data error!");
        }
        return data;
    }

    public static void saveData(String data, String reportId) {
        String filePath = "files/reportHtml/";
        filePath = filePath.replace("/", File.separator);
        filePath = filePath.replace("\\", File.separator);
        ServletContext sc = ServletActionContext.getServletContext();
        String fileRealPath = sc.getRealPath("/") + filePath;
        saveFile(data, reportId + ".data", fileRealPath);
        saveHtml(data, reportId + ".html", fileRealPath);
    }

    public static void saveFile(String data, String fileName, String filePath) {
        File file2 = new File(filePath);
        if (!file2.exists() || !file2.isDirectory()) file2.mkdirs();
        File file = new File(filePath + fileName);
        try {
            if (!file.exists()) file.createNewFile();
            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, false), "UTF-8"));
            out.write(data);
            out.close();
        } catch (IOException e) {
            LOGGER.error("Save file error!");
        }
    }

    public static void saveHtml(String data, String fileName, String filePath) {
        String htmlData = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">"
                + "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
                + "<meta charset=\"utf-8\" /><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" /><meta name=viewport content=\"width=device-width, initial-scale=1\" />"
                + "<link href=\"/report/semantic/dist/semantic.min.css\" rel=\"stylesheet\" /><link href=\"/report/css/main.css\" rel=\"stylesheet\" /><link href=\"/report/css/predisplay.css\" rel=\"stylesheet\" />"
                + "<style id=\"tablesort\">table.sortEnabled tr.firstRow th,table.sortEnabled tr.firstRow td{padding-right:20px;background-repeat: no-repeat;background-position: center right;   background-image:url(https://ueditor.baidu.com/ueditor/themes/default/images/sortable.png);}</style><style id=\"table\">.selectTdClass{background-color:#edf5fa !important}table.noBorderTable td,table.noBorderTable th,table.noBorderTable caption{border:1px dashed #ddd !important}table{margin-bottom:10px;border-collapse:collapse;display:table;}td,th{padding: 5px 10px;border: 1px solid #DDD;}caption{border:1px dashed #DDD;border-bottom:0;padding:3px;text-align:center;}th{border-top:1px solid #BBB;background-color:#F7F7F7;}table tr.firstRow th{border-top-width:2px;}.ue-table-interlace-color-single{ background-color: #fcfcfc; } .ue-table-interlace-color-double{ background-color: #f7faff; }td p{margin:0;padding:0;}</style>"
                + "<style>@font-face {font-family: 'Fang';src: url(../../file/Fonts/simfang.ttf) format('truetype');}td { font-family: '????????????'; }</style>"
                + "</head><body><div class=\"ui segments\"  id=\"paper\" style=\"border:0; width:790px\"><div class=\"ui segment\" id=\"father\" style=\"word-wrap:break-word\">";
        data = CodeToChar(data);
        LOGGER.info("data for html: " + data);
        JSONObject jsonData = JSONObject.fromObject(data);
        Iterator iterator = jsonData.keys();
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            JSONObject value = jsonData.getJSONObject(key);
            String type = value.getString("type");
            String text = value.getString("text");
            if (type.equals("graph")) {
                //htmlData += "<p class=\"" + type + "\" style=\"text-align: center;\">\n";
                //htmlData += "<img src=\"../" + text + "\">\n</p>\n";
            	int pos = text.indexOf("files");
            	text = text.substring(0, pos) + "../" + text.substring(pos);
            	htmlData += text;
            } else if (type.equals("table")) {
                //htmlData += "<table class=\"" + type + "\" style=\"margin: 0 auto;\">\n";
                htmlData += text;
                //htmlData += text.substring(7);
            } else if (type.equals("paging")) {
                //htmlData += "<div style=\"page-break-before:left\"></div>";
            	int pos = text.indexOf("----?????????----");
            	text = text.substring(0, pos) + text.substring(pos + 11);
            	htmlData += text;
            } else {
//                String style = "";
//                if (type.equals("texttitle1")) style = "text-align: center; font-family: SimHei; font-size: 18pt;";
//                else if (type.equals("texttitle2")) style = "text-align: left; font-family: SimHei; font-size: 16pt;";
//                else if (type.equals("texttitle3")) style = "text-align: left; font-family: SimHei; font-size: 14pt;";
//                else if (type.equals("texttitle4")) style = "text-align: left; font-family: SimHei; font-size: 12pt;";
//                else if (type.equals("textbody"))
//                    style = "text-indent: 24pt; text-align: left; font-family: ????????????; font-size: 12pt;";
//                else if (type.equals("textnote")) style = "text-align: left; font-family: KaiTi; font-size: 10.5pt;";
//                else if (type.equals("imagetitle"))
//                    style = "text-align: center; font-family: STXinwei; font-size: 12pt;";
                String newText = "";
                int last = 0;
                while(true)
                {
                	int start = text.indexOf("@@", last);
                	if(start == -1) {
                		newText += text.substring(last);
                		break;
                	}
                	int end = text.indexOf("@@", start + 2);
                	if(end == -1) {
                		LOGGER.error("@@ not match!");
                		break;
                	}
                	String bookmark = text.substring(start + 2, end);
                	newText += text.substring(last, start);
                	newText += ExecutePython.drawGraph(bookmark);
                	last = end + 2;
                }
                //htmlData += "<p class=\"" + type + "\" style=\"" + style + "\">" + newText + "</p>\n";
                htmlData += newText;
            }
        }
        htmlData += "</div>\n</div>\n</body>\n</html>\n";
        saveFile(htmlData, fileName, filePath);
    }

    public static void buildData(String data, String reportId, String areaCode, String areaLevel) {
        data = CodeToChar(data);
        LOGGER.info("data for save: " + data);
        JSONObject jsonData = JSONObject.fromObject(data);
        Iterator iterator = jsonData.keys();
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            JSONObject value = jsonData.getJSONObject(key);
            String type = value.getString("type");
            if (type.equals("graph")) {
                buildGraphResult(value, areaCode, areaLevel);
            } else if (type.equals("table")) {
                buildTableResult(value, areaCode, areaLevel);
            } else {
                buildTextResult(value, areaCode, areaLevel);
            }
        }
        LOGGER.info("json data: " + jsonData.toString());
        saveData(CharToCode(jsonData.toString()), reportId);
    }

    public static String buildBookmark(String bookmark, String areaCode, String areaLevel) {
        String mark = "";
        int num = 0;
        for (String s : bookmark.split("_")) {
            if (num == 0) {
                mark += areaCode;
            } else if (num == 1) {
                mark += "_" + areaLevel + s.substring(1);
            } else {
                mark += "_" + s;
            }
            num++;
        }
        return mark;
    }

    public static void buildGraphResult(JSONObject graphObject, String areaCode, String areaLevel) {
    	String bookmark = graphObject.getString("bookmark");
    	String text = graphObject.getString("text");
        String mark = buildBookmark(bookmark, areaCode, areaLevel);
        String result = ExecutePython.drawGraph(mark);
        String[] results = result.split("&");
        int posL = text.indexOf("graph/");
        int posR = text.indexOf(".png");
        graphObject.put("text", text.substring(0, posL + 6) + results[0] + text.substring(posR));
        graphObject.put("bookmark", mark);
    }

    public static void buildTableResult(JSONObject tableObject, String areaCode, String areaLevel) {
    	String bookmark = tableObject.getString("bookmark");
    	LOGGER.info("table before: " + bookmark);
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        JSONObject jsonData = JSONObject.fromObject(bookmark);
        Iterator iterator = jsonData.keys();
        ArrayList<JSONObject> sortedList = new ArrayList<>();
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            JSONObject value = jsonData.getJSONObject(key);
            sortedList.add(value);
        }
        Collections.sort(sortedList, new Comparator<JSONObject>() {
	        @Override
	        public int compare(JSONObject x, JSONObject y) {
	            int colX = x.getInt("col"), colY = y.getInt("col");
	            if (colX == colY) {
	            	int rowX = x.getInt("row"), rowY = y.getInt("row");
	                return rowX - rowY;
	            }
	            return colX - colY;
	        }
        });
        int index = 0;
        JSONObject newData = new JSONObject();
        for (JSONObject jsonObject : sortedList) {
            String type = jsonObject.getString("type");
            String text = jsonObject.getString("text");
            int row = jsonObject.getInt("row");
            int col = jsonObject.getInt("col");
            jsonObject.put("row", row);
            if(row >= list.size()) jsonObject.put("col", 0);
            else jsonObject.put("col", list.get(row).size());
            if ("bookmark".equals(type)) {
                String mark = buildBookmark(text, areaCode, areaLevel);
                jsonObject.put("text", mark);
                ArrayList<ArrayList<String>> result = parsePythonTable(ExecutePython.drawGraph(mark));
                buildTableList(list, row, result);
            } else {
                ArrayList<ArrayList<String>> result = new ArrayList<>();
                String elementSize = jsonObject.getString("type");
                int numRow = Integer.parseInt(elementSize.split("\\*")[0]), numCol = Integer.parseInt(elementSize.split("\\*")[1]);
                for(int i = 0; i < numRow; i++) {
                	ArrayList<String> content = new ArrayList<>();
                	for(int j = 0; j < numCol; j++) {
                		if(i == 0 && j == 0) {
                			content.add(text + "&&&" + elementSize);
                		} else {
                			content.add("SPAN_ELEMENT");
                		}
                	}
                	result.add(content);
                }
                buildTableList(list, row, result);
            }
            newData.put(index, jsonObject);
            index++;
        }
        LOGGER.info("table after : " + newData.toString());
        tableObject.put("text", buildTableHtml(list));
        tableObject.put("bookmark", newData);
    }

    public static void buildTextResult(JSONObject textObject, String areaCode, String areaLevel) {
        String text = textObject.getString("text");
        String newText = "";
        int last = 0;
        while(true)
        {
        	int start = text.indexOf("@@", last);
        	if(start == -1) {
        		newText += text.substring(last);
        		break;
        	}
        	int end = text.indexOf("@@", start + 2);
        	if(end == -1) {
        		LOGGER.error("@@ not match!");
        		break;
        	}
        	String bookmark = text.substring(start + 2, end);
        	LOGGER.info("text: " + bookmark);
        	newText += text.substring(last, start);
        	newText += "@@" + buildBookmark(bookmark, areaCode, areaLevel) + "@@";
        	last = end + 2;
        }
        textObject.put("text", newText);
    }

    public static void buildTableList(ArrayList<ArrayList<String>> list, int startRow,
                                      ArrayList<ArrayList<String>> result) {
        int delta = startRow + result.size() - list.size();
        for (int i = 0; i < delta; i++) list.add(new ArrayList<String>());
        int maxStart = 0;
        for (int i = 0; i < result.size(); i++)
            maxStart = Math.max(list.get(startRow + i).size(), maxStart);
        for (int i = 0; i < result.size(); i++) {
            ArrayList<String> l = list.get(startRow + i);
            delta = maxStart - l.size();
            for (int j = 0; j < delta; j++) l.add("");
        }
        int row = startRow;
        for (ArrayList<String> res : result) {
            ArrayList<String> l = list.get(row);
            for (String s : res) l.add(s);
            row++;
        }
    }

    public static ArrayList<ArrayList<String>> parsePythonTable(String result) {
    	LOGGER.info("python table result: " + result);
        ArrayList<ArrayList<String>> list = new ArrayList<>();
        ArrayList<String> firstDimension = parsePythonArray(result, 1);
        for (String fir : firstDimension) {
            ArrayList<String> secondDimension = parsePythonArray(fir, 0);
            list.add(secondDimension);
        }
        return list;
    }

    public static ArrayList<String> parsePythonArray(String arrayString, int pos) {
        ArrayList<String> list = new ArrayList<>();
        int length = arrayString.length();
        if (length > 0 && arrayString.charAt(0) == '[' && arrayString.charAt(length - 1) == ']') {
        	if(pos == 1 && (length < 2 || arrayString.charAt(1) != '[' || arrayString.charAt(length - 2) != ']')) {
        		list.add(arrayString);
        		return list;
        	}
        	arrayString = arrayString.substring(1, length - 1);
            
        } else {
        	list.add(arrayString);
        	return list;
        }
        int inBracket = 0;
        int inQuote = 0;
        String tmp = "";
        for (char c : arrayString.toCharArray()) {
            if (c == '[') inBracket++;
            if (c == ']') inBracket--;
            if (c == '\"') inQuote = 1 - inQuote;
            if (c == ',' && inBracket == 0 && inQuote == 0) {
            	tmp = tmp.trim();
            	if(tmp.length() > 0 && tmp.charAt(0) == '\'' && tmp.charAt(tmp.length() - 1) == '\'') tmp = tmp.substring(1, tmp.length() - 1);
                list.add(tmp);
                tmp = "";
            } else tmp += c;
        }
        if (!"".equals(tmp)) {
        	tmp = tmp.trim();
        	if(tmp.length() > 0 && tmp.charAt(0) == '\'' && tmp.charAt(tmp.length() - 1) == '\'') tmp = tmp.substring(1, tmp.length() - 1);
        	list.add(tmp);
        }
        return list;
    }

    public static String CharToCode(String data) {
        String res = "";
        for (int i = 0; i < data.length(); i++)
            res += (int) data.charAt(i) + ",";
        return res;
    }

    public static String CodeToChar(String data) {
        StringBuilder sb = new StringBuilder();
        for (String s : data.split(","))
            sb.append((char) Integer.parseInt(s));
        return sb.toString();
    }

    public static JSONArray SortTableJson(String jsonString) {
        ArrayList<JSONObject> result = new ArrayList<>();
        JSONObject jsonObject = JSONObject.fromObject(jsonString);
        for(Object o : JSONArray.fromObject(jsonString)) {
        	result.add((JSONObject) o);
        }
        Collections.sort(result, new Comparator<JSONObject>() {
	        @Override
	        public int compare(JSONObject x, JSONObject y) {
	            int colX = x.getInt("col"), colY = y.getInt("col");
	            if (colX == colY) {
	            	int rowX = x.getInt("row"), rowY = y.getInt("row");
	                return rowX - rowY;
	            }
	            return colX - colY;
	        }
        });
        return JSONArray.fromObject(result);
    }
    
    public static String buildTableHtml(ArrayList<ArrayList<String>> list) {
    	String html = "<table><tbody>";
    	for(ArrayList<String> l : list) {
    		html += "<tr>";
    		for(String s : l) {
    			if("SPAN_ELEMENT".equals(s)) continue;
    			String style = "style=\"border: 1px solid windowtext;\"";
    			String span = "";
    			String[] text = s.split("&&&");
    			if(text.length > 1) {
    				String elementSize = text[1];
                    String numRow = elementSize.split("\\*")[0], numCol = elementSize.split("\\*")[1];
                    span = "rowspan=\"" + numRow + "\" colspan=\"" + numCol + "\"";
    			}
    			html += "<td " + style + " " + span + ">";
    			html += text[0];
    			html += "</td>";
    		}
    		html += "</tr>";
    	}
    	
    	html += "</tbody></table>";
    	return html;
    }
}
