## 项目说明
该工程为maven 父工程，所有子工程都应添加父工程配置。

## maven 配置
* 配置jdk,与maven 环境变量
* 复制settings.xml 文件到 C:\Users\${登录用户名}\\.m2 目录下，并修改localRepository 指定到maven 仓库地址


## 子工程中的pom.xml 文件配置
* 在pom.xml 中添加以下配置

```xml
<parent>
	<groupId>com.cnlive</groupId>
	<artifactId>cnlive-parent</artifactId>
	<version>1.0.0-SNAPSHOT</version>
  </parent>
```

注意位置在 modelVersion 下面

## 工程版本定义规则
* 快照版本以 SNAPSHOT 结尾
* 正式版本以 RELEASE  结尾
* 版本号数字组成格式  主版本号.子版本号.bug修复版本号，初始版本数字1.0.0-SNAPSHOT