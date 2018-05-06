# IATheme
为你的APP来次华丽的主题变身吧~

IATheme是一个非常方便的转换主题背景及各元素的小型库.它可以帮助你完成大部分的主题替换功能,只需你在对应的位置提供资源即可.

## 2018.5.6更新内容
* 修复一个内存泄漏bug,在代码 **IAThemeManager** 类的 ```- (void)loadResourceWithPredicate:(IAThemePredicate *)predicate
                             load:(IALoadComplication)complication;``` 下,这个方法的回调函数 **complication** 会把皮肤管理对象也就是view给强引用,用weak修饰即可.
* 对应第一条,为释放不断增加的皮肤管理对象,我需要把不需要或者是已经被释放的皮肤管理对象从皮肤管理中移除掉,因此我在对应的方法下增加了如下方法:
```
- (void)loadResourceWithPredicate:(IAThemePredicate *)predicate load:(IALoadComplication)complication {
    IAThemeLoadResult *result = [self resultWithPredicate:predicate];
    if (complication) {
        NSMutableArray *releasedObjects = [NSMutableArray array];
        BOOL isRepeat = NO;
        
        for (IAThemePredicate *filter in self.resultCallbackMap.keyEnumerator) {
            // 收集被释放掉的皮肤管理对象
            if ([filter isObjectReleased]) {
                [releasedObjects addObject:filter];
                continue;
            }
            // 过滤掉重复的换肤对象
            if ([filter.filter isEqual:predicate.filter]) {
                isRepeat = YES;
            }
        }
        // 皮肤管理对象已被释放,需要移除回调代理,释放内存
        for (IAThemePredicate *predicate in releasedObjects) {
            [self.resultCallbackMap removeObjectForKey:predicate];
        }
        
        if (!isRepeat) {
            complication(result, result ? YES : NO);
            [self.resultCallbackMap setObject:complication forKey:predicate];
        }
    }
}
```

## 如何使用
> 所有资源都在IATheme文件夹下
1. 先配置**IAThemeDefines.h**文件的内容,一般来说你只需要改动 **defaultThemeKey** 这个key即可.它是控制默认显示的主题.
2. 看到**IAThemeConfig.plist**文件了吗,这个是用来配置对应主题下所管理的皮肤(或者是图片资源的),在这里还可以配置自定义的显示,比如:
我设置 ```color2 = 303030```,它表示我用**color2**这个key值读取对应主题下值为```0x303030```的颜色.
使用起来就像这样:
```
[view ia_setBackgroundColorWithKey:@"color2"];
```
3. 一般需要用到的分类方法我都写在UIKit文件夹下了:只需要如下调用即可:
```
// 在切换主题的时候会自动切换对应颜色,需要做其他操作
[self.view ia_setThemeColor];
```

## 如何自定义
拿UIView的分类方法```- (void)ia_setThemeColor```为例,
```
// IAThemePredicate这个类是描述所要改变的类型,是颜色、还是图片,是自定义、还是默认,如果是自定义,key的值为多少,等等
    IAThemePredicate *predicate = [[IAThemePredicate alloc] init];
    predicate.sourceType = IASourceTypeColor;
    predicate.key = IAKeyDefault;
    // 这个是简便宏,记录hash值,过滤重复添加的皮肤管理对象,有兴趣可以试试tableView的滚动看看
    kIAFilterKey(nil);
    
    __weak typeof(self) weakSelf = self;
    // 加载
    [[IAThemeManager sharedManager] loadResourceWithPredicate:predicate load:^(IAThemeLoadResult *result, BOOL loadSuccess) {
        if (loadSuccess) {
        // 取结果
            weakSelf.backgroundColor = result.color;
        }
    }];
```
