
@Entry
@Component
struct Page4 {
  @State score: number = 0
  @State gradeText: string = ''//gradeText 保存查询后得结果

  // TODO 1: 按下列规则返回等级
  //   score >= 90                → '优秀'
  //   score >= 80                → '良好'
  //   score >= 60                → '及格'
  //   0 <= score < 60            → '不及格'
  //   score < 0 或 score > 100   → '成绩无效'
  getGrade(score: number): string {
    if (score < 0 || score > 100) {
      return '成绩无效'
    } else if (score >= 90 ) {
      return '优秀'
    } else if (score >= 80) {
      return '良好'
    } else if (score >= 60) {
      return '及格'
    } else {
      return '不及格'
    }
  }

  // TODO 2: 把 getGrade 的结果赋给 gradeText
  check() {
    this.gradeText = this.getGrade(this.score)//把gradeText被getGrade赋值
  }

  build() {
    Column({ space: 20 }) {
      TextInput({ placeholder: '请输入成绩', text: this.score.toString() })
        .type(InputType.Number)
        .onChange((v: string) => {
          this.score = Number(v)
        })
      Text(this.gradeText)
        .fontSize(24)
      Button('查询等级')
        .id('btn_check')
        .margin({ top: 10 })
        .onClick(() => this.check())   // TODO 3: 若此处未绑定，需自行补上
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}