package com.key.report.utils;

import com.key.common.base.dao.UserDao;
import com.key.common.base.entity.User;
import com.key.common.plugs.page.Page;
import com.key.common.utils.SpringContextHolder;
import com.key.common.utils.parsehtml.HtmlUtil;
import com.key.report.entity.*;
import com.key.report.service.UserManager;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by keyuan on 17/11/5.
 */
public class ExportUserAnswer implements Runnable {


    private UserManager userManager;
    private UserDao userDao;
    //查询
    Page<User> page = new Page<User>();
    XSSFSheet sheet = null;
    XSSFWorkbook workBook= null;
    String savePath = null;

    public ExportUserAnswer(final Page<User> page,final String savePath){
        this.page = page;
        this.savePath = savePath;
    }

    @Override
    public void run() {

        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet();// 创建一个工作薄对象

        List<User> users = page.getResult();
        int rowIndex = 1;
        for (User user:users) {
            String userId = user.getId();
            Criterion cri1 = Restrictions.eq("userId", userId);
            
            System.out.println(Thread.currentThread().getName()+" row is :" + rowIndex + "; userName:" + user.getName());
        }
//        System.out.println(Thread.currentThread().getName()+":   "+i++);
// 文件输出流
        try{
            FileOutputStream os = new FileOutputStream(savePath);
            workBook.write(os);// 将文档对象写入文件输出流
            os.close();// 关闭文件输出流
            System.out.println("创建成功 office 2007 excel"+savePath);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
