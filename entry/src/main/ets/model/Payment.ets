// ===== 第一档：枚举（5 分）=====
export enum PayType {
  ALI = '支付宝',
  WECHAT = '微信',
  BALANCE = '余额'
}

// ===== 第二档：接口（5 分）=====
export interface IPayable {
  pay(amount: number): number
}

// ===== 第三档：抽象类 + 三个子类（5 分）=====
export abstract class Payment implements IPayable {
  protected paid: 'yes' | 'no' = 'no'
  protected type: string

  constructor(type: string) {
    this.type = type
  }

  getPaid(): string {
    return this.paid
  }

  abstract pay(amount: number): number
}

export class AliPay extends Payment {
  constructor() {
    super(PayType.ALI)          // 子类 super 把 type 塞死，别在子类再赋值
  }

  pay(amount: number): number {
    this.paid = 'yes'
    return amount * 0.95
  }
}

export class WeChatPay extends Payment {
  constructor() {
    super(PayType.WECHAT)
  }

  pay(amount: number): number {
    this.paid = 'yes'
    return amount >= 100 ? amount - 10 : amount   // 满减用三元，一行搞定
  }
}

export class Balance extends Payment {
  private balance: number

  constructor(balance: number) {
    super(PayType.BALANCE)
    this.balance = balance
  }

  pay(amount: number): number {
    if (this.balance >= amount) {
      this.balance -= amount
      this.paid = 'yes'
      return amount
    }
    return 0                     // 余额不足返回 0，且不置 paid
  }
}