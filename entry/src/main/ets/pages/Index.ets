import { window } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct BrightnessSetPage {
  @State tipText: string = '当前：跟随系统亮度'
  private win: window.Window | null = null

  aboutToAppear(): void {
    const uiCtx: UIContext = this.getUIContext()
    const hostCtx: common.BaseContext | undefined = uiCtx.getHostContext()
    if (hostCtx) {//`if(hostCtx)`：防止 hostCtx 是 undefined，传给 API 引发报错、类型错误
      window.getLastWindow(hostCtx).then((winObj: window.Window) => {//getLastWindow是异步意思：发出一个 “去拿窗口” 的请求，代码不会停下来等结果，直接往下跑。
        this.win = winObj
      }).catch((err: BusinessError) => {
        console.error('获取窗口失败：', JSON.stringify(err))
      })
    }
  }

  setDark(): void {
    // TODO 在这里写【调暗】逻辑
if(this.win){//判断win是否拿到值，不是NUll
    this.win.setWindowBrightness(0.2)
}
this.tipText="当前：暗亮度"
  }

  setNormal(): void {
    // TODO 在这里写【标准亮度】逻辑
    if(this.win){
      this.win.setWindowBrightness(0.8)
    }
    this.tipText="当前：标准亮度"
  }

  setFollowSys(): void {
    // TODO 在这里写【跟随系统】逻辑
    if(this.win){
      this.win.setWindowBrightness(-1)
    }
    this.tipText="当前：跟随系统亮度"
  }

  build() {
    Column() {
      Text('阅读器亮度设置')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Text(this.tipText)
        .fontSize(16)
        .margin({ top: 12 })
      Row() {
        Button('调暗')
          .margin(8)
          .onClick(() => this.setDark())
        Button('标准亮度')
          .margin(8)
          .onClick(() => this.setNormal())
        Button('跟随系统')
          .margin(8)
          .onClick(() => this.setFollowSys())
      }
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
