translate.language.setLocal('chinese_simplified'); //设置本地语种（当前网页的语种）。如果不设置，默认自动识别当前网页显示文字的语种。 可填写如 'english'、'chinese_simplified' 等，具体参见文档下方关于此的说明。
translate.service.use('client.edge'); //设置机器翻译服务通道，直接客户端本身，不依赖服务端 。相关说明参考 http://translate.zvo.cn/43086.html
translate.language.translateLanguagesRange = ['chinese_simplified'];
translate.images.add({
    "./img/help.png":"./img/help_en.png",
    "./img/img_cmd.png":"./img/img_cmd_en.png",
});

translate.office.append('english',`
[永久]=[Permanently]
非常重要：域名已更变，请收藏当前网址!=Important: The domain name has changed. Please bookmark the current URL!
捐赠记录=DonateRecords
演示图例=OperationDemo
自建线路=SelfbuiltRoute
详细教程=DetailedTutorial
返回首页=ReturnHomepage
命令提示符(管理员)：=Command Prompt (Administrator)：
Windows系统一句命令激活=Activate Windows with a single command
安卓手机自建 KMS 服务器=Build a KMS Server on Android Phone
`);

translate.execute();//进行翻译
