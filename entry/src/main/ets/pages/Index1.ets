import { ConfigurationConstant } from '@kit.AbilityKit'

@Entry
@Component
struct Page1 {
  @State colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
  @State modeText: string = '浅色模式'

  switchTheme() {
    // TODO: 三态轮换，靠 if / else if / else 三段接力
    if (this.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      this.colorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK
      this.modeText = '深色模式'
    } else if (this.colorMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK) {
      this.colorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET
      this.modeText = '跟随系统'
    } else {
      // 末尾必须用 else 兜底，不用再判断一次，防止漏网导致卡死在某态
      this.colorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
      this.modeText = '浅色模式'
    }
    const hostCtx = this.getUIContext().getHostContext()
    if (hostCtx) {
      hostCtx.getApplicationContext().setColorMode(this.colorMode)
    }
  }
    // TODO
  build() {
    Column() {
      Text(this.modeText).fontSize(20)
      Button('切换主题')
        .onClick(() => this.switchTheme())
        .margin({ top: 20 })
    }
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }
}