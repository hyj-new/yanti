@Entry
@Component
struct Page8 {
  private percent: number = 50
  private seconds: number = 65
  @State percentText: string = ''
  @State remainText: string = ''

  // TODO 1: 格式化百分比
  //   小于 0 按 0 算，大于 100 按 100 算
  //   保留 1 位小数，带 % 号
  //   50 → '50.0%'     123 → '100.0%'     -8 → '0.0%'
  formatPercent(percent: number): string {
    let p =percent
    if(p>100){
      p=100.0
    } else if(p<0){
      p=0.0
    }
    return p.toFixed(1)+"%"
  }//let 的用法一let p = percent if(p>100){}
  //方法二 let score:number score=88:先声明后赋值
  //方法三 for( let i=0;i<5;i++){console.log(i)}: for循环单独i
  //方法四 配合类型注解 let num: number = 10
  // 不要修改 this.percent（外面的成员变量），我们只处理传进来的这个参数，新建一个临时变量
  //p.toFixed(1)将100.0变成字符串


  // TODO 2: 格式化剩余时间
  //   转为 分:秒，分钟不折算成小时
  //   分和秒不足两位前面补 0
  //   seconds <= 0 → '00:00'
  //   65   → '01:05'     3661 → '61:01'     9 → '00:09'
  formatRemain(seconds: number): string {
    if(seconds<=0){
      return "00:00"
    }
    let min = Math.floor(seconds / 60)// 计算分钟：总秒数÷60，向下取整
    let sec = seconds % 60
    let minStr = min < 10 ? '0' + min : min.toString()// 分钟转字符串：小于10前面补0
    let secStr = sec < 10 ? '0' + sec : sec.toString()
    return minStr + ':' + secStr// 拼接成 分:秒 返回
  }

  aboutToAppear() {
    this.percentText = this.formatPercent(this.percent)
    this.remainText = this.formatRemain(this.seconds)
  }

  build() {
    Column({ space: 12 }) {
      Text('文件下载中').fontSize(20)
      Text(`进度：${this.percentText}`).fontSize(16)
      Text(`剩余：${this.remainText}`).fontSize(16)
    }
    .width('100%')
    .padding(20)
  }
}