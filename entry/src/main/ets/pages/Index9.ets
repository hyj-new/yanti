@Component
struct VolumeBar {
  // TODO 1: 给 volume 选对装饰器——要求能"接收父组件的值"并且"改动能回传给父组件"（双向）
  volume: number = 0

  build() {
    Column() {
      Text(`滑块值：${this.volume}`)
        .fontSize(14)
        .fontColor('#666666')
      Slider({
        value: this.volume,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .onChange((value: number, mode: SliderChangeMode) => {
          // TODO 2: 把滑块的新值写回 volume，使父组件同步
        })
    }
    .width('100%')
  }
}

@Entry
@Component
struct Page9 {
  @State volume: number = 40

  build() {
    Column() {
      Text('音量控制')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Text(`当前音量：${this.volume}`)
        .fontSize(16)
        .margin({ top: 12 })
      VolumeBar({ volume: this.volume })   // TODO 3: 改成双向绑定写法
        .margin({ top: 16 })
      Button('静音')
        .margin({ top: 24 })
        .onClick(() => {
          this.volume = 0
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}