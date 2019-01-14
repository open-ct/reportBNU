## 安装

因为本系统是基于JAVA WEB实现，所以安装与一般的JAVA WEB程序无异，配置好数据库地址就可以正常使用。

### 安装说明

	服务器必须安装由 JAVA 1.7、MySQL、Apache Tomcat 构成的环境

	由于引用的外部jar在本地maven仓库中可能没有，这时只要本地有maven环境，执行下bin目录下面的文件就可以自动导入。

## 环境配置说明

    lib目录下的几个jar包可能是中央仓库没有，所以运行时如果提示找不到相关jar

    就请到bin目录下去执行jar导入命命，安装中央仓库缺失jar

    可直接执行 install-lose-jar.bat

### 配置说明、数据初始化

    先在mysql导入/lib目录下的report.sql和report_manager.sql数据库脚本文件