# 区域教育教育质量健康体检项目组报告撰写系统

### 项目介绍
报告撰写系统

### 安装教程

#### 安装环境
JAVA 1.7、MySQL、Apache Tomcat、maven

#### 配置maven库
执行bin/install-lose-jar.bat，导入外部依赖jar包

#### 配置出图模块
安装教程见DrawGraph项目

#### 导入数据库
在MySQL中导入lib/report.sql（出图模块DrawGraph使用，如已在出图模块中配置可不用重复导入）和lib/report_manager.sql（报告撰写模块使用）

#### 安装字体文件
安装lib/仿宋_GB2312.ttf字体文件

#### 配置项目路径：
    1. 修改src/main/resources/conf/application.properties中的jdbc到之前导入的本地MySQL数据库
    2. 修改src/main/java/com/key/report/utils/ReportConfig.java：
       PYTHON_PATH指向出图模块python/Scripts/python
       PYTHON_FILE_PATH指向出图模块process.py文件
       HTML_URL指向报告系统url下files/reportHtml/文件夹
       PDF_PATH指向本地报告系统部署路径下files/reportPDF/文件夹
       WK_PATH指向出图模块wkhtmltopdf/bin/wkhtmltopdf文件路径