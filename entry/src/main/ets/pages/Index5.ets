import { AliPay, WeChatPay, Balance, PayType } from '../model/Payment'

@Entry
@Component
struct Page5 {
  @State amount: number = 200
  @State resultText: string = ''
  private ali: AliPay = new AliPay()
  private wx: WeChatPay = new WeChatPay()
  private bal: Balance = new Balance(150)

  // TODO 11: 完善 payBy(type: PayType)
  //   支付宝 → 用 this.ali
  //   微信   → 用 this.wx
  //   余额   → 用 this.bal
  //   返回金额大于 0 → resultText = `支付成功：¥${金额}`
  //   返回 0        → resultText = '支付失败'

  payBy(type: PayType) {
      let res: number = 0  // 必须给初值，否则编译器认为可能未赋值

      switch(type) {
        case PayType.ALI:
          res =this.ali.pay(this.amount)
          // 支付宝分支
          break
        case PayType.WECHAT:
          res =this.wx.pay(this.amount)
          // 微信分支
          break
        case PayType.BALANCE:
          res =this.bal.pay(this.amount)
          // 余额分支
          break
      }
    if (res > 0) {
      this.resultText = `支付成功：¥${res}`
    } else {
      this.resultText = '支付失败'
    }
  }

  build() {
    Column({ space: 12 }) {
      Text('确认支付').fontSize(20)
      Text(`订单金额：¥${this.amount}`).fontSize(16)
      Button('支付宝支付').width('80%').onClick(() => this.payBy(PayType.ALI))
      Button('微信支付').width('80%').onClick(() => this.payBy(PayType.WECHAT))
      Button('余额支付').width('80%').onClick(() => this.payBy(PayType.BALANCE))
      Text(this.resultText).fontSize(18).margin({ top: 16 })
    }
    .width('100%')
    .padding(20)
  }
}