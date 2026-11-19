# yanti

HarmonyOS / ArkTS **单页练习集合**：10 个独立 `@Entry` 页面，每页演示一个 ArkUI 或 ArkTS 知识点，用于鸿蒙应用开发学习与验证。

> 本项目定位是「练习集」而非可导航的单体 App：`main_pages.json` 只注册了 `pages/Index`，源码中没有任何 `router.pushUrl` 跳转，运行时只会进入亮度设置页；其余 9 页需在 DevEco Studio 中通过预览或临时修改入口来单独查看。

## 页面清单

| 文件 | struct | 演示内容 |
|---|---|---|
| `pages/Index.ets` | `BrightnessSetPage` | 阅读器亮度设置：`window.setWindowBrightness(0.2 / 0.8 / -1)` 调暗、标准、跟随系统 |
| `pages/Index1.ets` | `Page1` | 主题切换：`ConfigurationConstant.ColorMode` 三态（浅色 / 深色 / 跟随系统） |
| `pages/Index2.ets` | `Page2` | 商品评价五星展示（`ForEach` 渲染 5 个 `Image`） |
| `pages/Index3.ets` | `Page3` | 标签去重：`uniqueTags()` 用 `includes` 去重后拼接 |
| `pages/Index4.ets` | `Page4` | 成绩等级：`getGrade()` 90 优秀 / 80 良好 / 60 及格 / 低于 60 不及格 |
| `pages/Index5.ets` | `Page5` | 支付策略：`payBy(type)` 按支付宝 / 微信 / 余额返回支付结果 |
| `pages/Index6.ets` | `Page7` | 待办清单：`all / done / undone` 三态过滤、计数、切换、已完成加删除线 |
| `pages/Index7.ets` | `Page8` | 百分比格式化：`formatPercent()` 限幅 0~100、保留 1 位小数 |
| `pages/Index9.ets` | `VolumeBar` / `Page9` | 音量控制：`Slider` 双向绑定、数值显示、静音置 0 |

## 数据模型

`model/Payment.ets`（67 行）是策略模式练习：

- `PayType` 枚举：支付宝 / 微信 / 余额
- `IPayable` 接口、抽象类 `Payment`（`paid: 'yes' | 'no'`、`getPaid()`、抽象 `pay()`）
- 三个子类：`AliPay`（95 折）、`WeChatPay`（满 100 减 10）、`Balance`（余额充足才扣款，否则返回 0）

## 工程结构

```
entry/src/main/ets/
├── entryability/EntryAbility.ets          # onCreate 置 COLOR_MODE_NOT_SET，加载 pages/Index
├── entrybackupability/EntryBackupAbility.ets
├── model/Payment.ets                      # 支付策略模式
└── pages/Index.ets ~ Index9.ets            # 10 个 @Entry 练习页
```

- `module.json5`：`type="entry"`、`mainElement="EntryAbility"`、`deviceTypes=["phone"]`
- **不申请任何权限**（无相机、网络、位置、存储）

## 关键 API

`@kit.AbilityKit`（`UIAbility`、`ConfigurationConstant`、`ApplicationContext.setColorMode`）、`@kit.ArkUI`（`window.setWindowBrightness`）、`@kit.PerformanceAnalysisKit`（`hilog`）、`Slider`、`ForEach`。

## 技术栈

| 项 | 值 |
|---|---|
| 语言 / UI | ArkTS / ArkUI 声明式 |
| targetSdkVersion / compatibleSdkVersion | 6.1.1(24) / 6.1.1(24) |
| 包名 | `com.example.yanti` |
| 模型版本 | 6.1.1 |
| 测试依赖 | `@ohos/hypium 1.0.25`、`@ohos/hamock 1.0.0` |

## 运行

1. DevEco Studio 打开工程，SDK 选 HarmonyOS **6.1.1(24)**
2. 运行到 HarmonyOS 6.x 手机或模拟器（`deviceTypes` 仅 `phone`）
3. 真机安装前需在 `build-profile.json5` 中配置签名（当前 `signingConfigs` 为空）
4. 查看非首页的练习页：在 DevEco Studio 中对目标 `.ets` 使用预览，或临时把该页加入 `main_pages.json` 并改 `EntryAbility` 的加载页

## 已知限制

- `Index2.ets` 星级显示与文件内 TODO 注释要求相反：注释要求「索引 < rating 显示 `star_full`」，实际代码在 `index < rating` 时使用 `star_empty`；且 `rating` 固定为 3，无交互入口
- `Index.ets` 依赖 `window.getLastWindow` 异步回调取得窗口，回调完成前点击按钮会被 `if (this.win)` 判空拦下，界面无变化
- 未配置签名，无法直接装真机

## License

[MIT](LICENSE)
