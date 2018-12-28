package com.key.report.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

public class ExecutePython {
    private static final Logger LOGGER = LoggerFactory.getLogger(ExecutePython.class);

    public static String drawGraph(String bookmark) {
        String s = "--bookmark=" + bookmark;
        String line = "";
        try {
            Process process = Runtime.getRuntime().exec(ReportConfig.PYTHON_PATH + " " + ReportConfig.PYTHON_FILE_PATH + " " + s);
            process.waitFor();
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), Charset.forName("GBK")));
            line = br.readLine();
        } catch (IOException | InterruptedException e) {
            LOGGER.error("Draw graph error!");
        }
        return line;
    }

    public static String htmlToPDF(String reportId) {
        String url = ReportConfig.HTML_URL + reportId + ".html";
        String filePath = ReportConfig.PDF_PATH;
        File file2 = new File(filePath);
        if (!file2.exists() || !file2.isDirectory()) file2.mkdirs();
        String filename = "\"" + filePath + reportId + ".pdf\"";
        String cmd = ReportConfig.WK_PATH + " " + ReportConfig.WK_PARA + " " + url + " " + filename;
        try {
            Process process = Runtime.getRuntime().exec(cmd);
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            LOGGER.error("Convert PDF error!");
        }
        return reportId + ".pdf";
    }

}
