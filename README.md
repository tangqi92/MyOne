# MyOne

项目来源：https://github.com/meilbn/MyOne-iOS

本项目以此为基础进行二次开发（其实，更多是学习啦~）

## 关于

与 [官方的 App](http://wufazhuce.com/) 区别暂时有：

1. 没有广告 — 太棒了。
2. 没有阅读限制 — 官方是首页、文章、问题、东西都限制为查看最近的 10 条。
3. 暂时没做登录 — 收藏应该是存在本地 (待定)。
4. ~~暂时没做分享功能。~~

获取过的数据会先存在本地，下次查看也是先加载本地的缓存(还没想好是否真的要这样，感觉有些数据具有时效性，加载本地的话，有些数据可能已经过时了，比如点赞数)。  

获取最新的数据的话，暂时还没想好要怎么覆盖好一点，这个后面慢慢想。

## 问题

1. 在开启**夜间模式**之后，第一次打开**文章**和**问题**模块的时候，会有白色的闪屏，估计原因在于这两个界面是用 UIWebView 的形式展示数据的 (首页、东西模块是没有这个问题的)，但是尝试过设置 UIWebView 和 UIWebView 的 UIScrollView 子视图的背景色都没有用。
2. **问题模块**，在夜间模式的时候，显示的两个图片样式不是夜间模式的样式，在 HTML 代码里面引用的是官方手机版网页上的图片。
3. **问题模块**，用官方接口只能获取到最近10天的数据，之后获取过来的数据就是空的了，现在的解决办法暂时是直接显示官方“问题”模块对应的当天的手机版网页。
4. 还不能**点赞**，因为官方点赞接口里面有一个参数： ``strDeviceId``，看名字应该是设备的唯一标识，64位长度，我尝试过获取设备的唯一标识然后加密，没有成功获取到和官方的请求接口中相同的值，都是在我自己的 iPhone 5S 上测试的。
5. **个人模块**没有做，主要也是因为一个参数的问题，官方接口中有一个参数： ``strUi``，应该是登录用户的 id。
6. ~~阅读第一篇文章、问题的时候，点击状态栏，UIWebView 是可以滚动到顶部的，但是滑动查看其他日期的数据之后，点击状态栏就不能使界面滚动到顶部了。~~ ___(已解决，解决办法在[这里](http://www.jianshu.com/p/836cdd481982)，感谢作者！)___
7. ~~首页、文章、问题、东西界面，右拉刷新还没有做。~~ ___(已完成，首页已经测试，已发现问题，东西也一样，其他模块还有待测试。)___
8. 首页、东西模块发现 Bug，要么漏掉一天，要么有一天重复了，这个还有待修复。

## 截图

### 普通模式

#### 首页

<img src="/Screenshot/Home.gif" alt="screenshot" title="screenshot" width="365" height="667" />

<img src="/Screenshot/Images/Reading_0.png" alt="screenshot" title="screenshot" width="365" height="667" />  <img src="/Screenshot/Images/Reading_1.png" alt="screenshot" title="screenshot" width="365" height="667" />  

<img src="/Screenshot/Images/Question_0.png" alt="screenshot" title="screenshot" width="365" height="667" />  <img src="/Screenshot/Images/Question_1.png" alt="screenshot" title="screenshot" width="365" height="667" />  

<img src="/Screenshot/Images/Thing.png" alt="screenshot" title="screenshot" width="365" height="667" />  <img src="/Screenshot/Images/Personal.png" alt="screenshot" title="screenshot" width="365" height="667" />  

<img src="/Screenshot/Images/Settings.png" alt="screenshot" title="screenshot" width="365" height="667" />  <img src="/Screenshot/Images/About.png" alt="screenshot" title="screenshot" width="365" height="667" />  

### 夜间模式

#### 首页

<img src="/Screenshot/NightMode/Night_Mode_Home.png" alt="screenshot" title="screenshot" width="365" height="667" />  

<img src="/Screenshot/NightMode/Night_Mode_Reading_0.png" alt="screenshot" title="screenshot" width="365" height="667" />  <img src="/Screenshot/NightMode/Night_Mode_Reading_1.png" alt="screenshot" title="screenshot" width="365" height="667" />    

<img src="/Screenshot/NightMode/Night_Mode_Question.png" alt="screenshot" title="screenshot" width="365" height="667" />  <img src="/Screenshot/NightMode/Night_Mode_Thing.png" alt="screenshot" title="screenshot" width="365" height="667" />  

<img src="/Screenshot/NightMode/Night_Mode_Personal.png" alt="screenshot" title="screenshot" width="365" height="667" />  <img src="/Screenshot/NightMode/Night_Mode_Settings.png" alt="screenshot" title="screenshot" width="365" height="667" />  