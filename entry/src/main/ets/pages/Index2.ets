@Entry
@Component
struct Page2 {
  @State rating: number = 3

  build() {
    Column() {
      Text('商品评价')
        .fontSize(20)
      // TODO 1: 这里放一个 Row，内部用 ForEach 渲染 5 颗星
      //         索引 < this.rating → $r('app.media.star_full')
      //         否则           → $r('app.media.star_empty')
      //         每颗星 24×24，间距 4，Row 整体水平居中
      Row({space:4}){
        ForEach([0,1,2,3,4],(index:number)=>{
          if(index<this.rating){
            Image($r('app.media.star_empty'))
              .width(24)
              .height(24)//margin是外边距，padding是内边距
          }else {
            Image($r('app.media.star_full'))
              .width(24)
              .height(24)
          }
        },(index:number)=>index.toString())
      }
      .justifyContent(FlexAlign.Center)

      //rating:是鸿蒙组件自带的,
      //@State rating :number=3.5
      // Row(){
      // Rating({rating:this.rating,indicator:false}).stars(5)这是星星的个数.stepSize(0.5)这是控制星星的布长
      // .onChange((this.rating=value))}


      Text(`当前评分：${this.rating}`)
        .fontSize(16)
        .margin({ top: 12 })
    }
    .width('100%')
    .padding(20)
  }
}