@Entry
@Component
struct Page3 {
  private rawTags: string[] = ['鸿蒙', 'ArkTS', '鸿蒙', '组件', 'ArkTS']
  @State showTags: string = ''//@State:状态变量，这个变量一变，页面上的文字自动刷新

  // TODO: 去重并保留首次出现顺序
  // 输入 ['鸿蒙','ArkTS','鸿蒙','组件','ArkTS']
  // 输出 ['鸿蒙','ArkTS','组件']   ← 必须返回新数组，不得改动 tags

  uniqueTags(tags: string[]): string[] {//tags:string[]类型约束
    const result: string[] = []//创建一个全新的空数组 result(新蓝子)
    for (let i = 0; i < tags.length; i++) {//for (①初始化; ②判断条件; ③每次循环结束后执行)

      if (!result.includes(tags[i])) {
        result.push(tags[i])
      }
    }
    return result//返回标签
  }
//TODO
  aboutToAppear() {
    this.showTags = this.uniqueTags(this.rawTags).join(' · ')
  }

  build() {
    Column({ space: 16 }) {
      Text('标签管理')
        .fontSize(20)
      Text(this.showTags)
        .fontSize(16)
    }
    .width('100%')
    .padding(20)
  }
}