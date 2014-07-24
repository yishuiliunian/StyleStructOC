#Style Struct OC FrameWork

————————————
表现与结构分离的IOS开发框架
——————————

##起源
在开发IOS App时间长了之后，突然间发现，在进行UI编程的时候，其实很多时候都是在对各种空间进行空间结构和样式的配置，比如：

```
SSView* a = [SSView new];
a.backgourdColor = [UIColor clearColor];
...
[self.view addSubView:a];
...

@interface SSView : UIView

@end

@implementation SSView

- (void) layoutSubViews
{
	....
	a.frame = CGRectMake(10,10,10,10);
	...
}
@end
```

我们创建了一个UIView实例然后对其样式进行配置，比如背景```.backgourdColor = [UIColor clearColor];```，之后对其空间样式进行配置```[self.view addSubView:a];```，当然为了更好的进行空间的布局我们有些时候也会子类化UIView，并且在其LayoutSubViews里面进行一些布局控制，正如上面的代码所示：

```
- (void) layoutSubViews
{
	....
	a.frame = CGRectMake(10,10,10,10);
	...
}
```

每当写大量的这样的一些OC代码的时候，我就下意识地想到HTML和CSS这种结构与表现分离，甚至视图能够更好的与业务逻辑解耦的架构方式。为什么IOS就没有这样的一个框架呢？

当然你会说有像PhoneGap这样可以直接使用H5来写IOS App的框架，也有像nui和beeframework这样的一些可以定义样式的框架。但是我试用了之后，觉得他们达不到我的要求。

我想要一个能够有更好的结构关系的框架，让人们开发IOS APP有点像ROR一样。基于约定和配置，你就可以构建出一个不错的App了。于是，就开始研究这样的一个框架的实现。

##任务

1. 样式层，CSS解析器和类似于CSS语法的一套配置语言
2. 一套相对布局的语言
3. 框架设计（样式、表现、试图控制器、业务逻辑依赖注册、持久化层中间件、关系数据库的ORM处理）
4. 测试