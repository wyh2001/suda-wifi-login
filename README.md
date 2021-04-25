# suda-wifi-login  
一个Python脚本，用于快速登录苏州大学校园网  
# 依赖  
* Python3  
* requests  
# 配置  
在`config.json`中填写学号，密码与运营商（“中国移动”或“校园网”）信息  
# 使用  
将`login.py`与`config.json`放于同一目录，运行`login.py`  
# 自动化登录
可利用Windwos下的任务计划程序，实现连接到特定无线网络时运行程序
## 具体步骤
### 通过脚本创建计划任务
1. 配置完config.json后，将`login.py`，`config.json`以及`auto-login.bat`放于同一目录
2. 使用**管理员身份**运行`auto-login.bat`，根据提示进行操作
### 手动创建计划任务
1. 创建一个任务，命名一个名称，如：“校园网自动登录”。接着为这个任务添加一个自定义的触发器：新建->触发器->开始任务->发生事件时->自定义->新建事件筛选器
2. 按日志 -> 事件日志-(应用程序和服务日志)-Microsoft-Windows-WLAN-AutoConfig/Operational -> 事件来源-WLAN-AutoConfig -> 事件ID-8001 -> XML
3. 勾选“手动编辑查询” -> 在`</Select>`前增加代码`[EventData[Data[@Name='SSID']='SUDA_WIFI']]`
4. 确定以后，在选择触发时运行的脚本：操作->新建->启动程序-程序或脚本，填入程序路径:
* 第一栏填写Python安装目录下的`pythonw.exe`的完整路径
* 第二栏填写Python脚本路径
* 第三栏填写`config.json`所在目录的完整路径
