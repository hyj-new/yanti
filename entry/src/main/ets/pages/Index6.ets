export interface Todo {//export作用是**把【类、接口、类型、函数、组件、变量】导出，给别的 .ets 文件 import 导入使用**Harmo...
  id: number
  title: string
  isDone: boolean
}

@Entry
@Component
struct Page7 {
  @State todos: Todo[] = [//`Todo[]`：Todo 对象组成的数组，**不是 `[1,"文字",false]` 这种零散数据**
    { id: 1, title: '背单词', isDone: false },
    { id: 2, title: '写代码', isDone: true },
    { id: 3, title: '跑步', isDone: false }
  ]
  @State filter: 'all' | 'done' | 'undone' = 'all'


  // TODO 1: 按 this.filter 过滤
  //   'done'   → 只返回已完成
  //   'undone' → 只返回未完成
  //   'all'    → 返回全部
  getFilteredTodos(): Todo[] {//getFilteredTodos(): 在Todo[]中 **待办列表的筛选计算属性**：根据筛选条件
    // TODO: 按 filter 过滤，返回新数组

      if (this.filter === 'done') {//`===`：绝对相等，值和类型都要一样
        return this.todos.filter((item: Todo) => item.isDone)
      } else if (this.filter === 'undone') {
        return this.todos.filter((item: Todo) => !item.isDone)
      }
    return this.todos
  }

  // TODO 2: 统计对应状态的数量
  countByStatus(status: 'done' | 'undone'): number {
    return this.todos.filter((item: Todo) =>
    status === 'done' ? item.isDone : !item.isDone
    ).length
  }

  // TODO 3: 切换指定 id 的完成状态
  //         要求：界面必须立即刷新
  toggleTodo(id: number): void {
    this.todos = this.todos.map((item: Todo) => {
      if (item.id === id) {
        const next: Todo = { id: item.id, title: item.title, isDone: !item.isDone }
        return next
      }
      return item
    })
  }

  build() {
    Column({ space: 12 }) {
      Row({ space: 8 }) {
        Button('全部').onClick(() => { this.filter = 'all' })
        Button('未完成').onClick(() => { this.filter = 'undone' })
        Button('已完成').onClick(() => { this.filter = 'done' })
      }
      Text(`未完成 ${this.countByStatus('undone')} 项`)
        .fontSize(16)
      List() {
        ForEach(this.getFilteredTodos(), (item: Todo) => {
          // TODO 4: 渲染 ListItem
          //   Row 内放 Text(item.title)，18 号字
          //   已完成的文字加删除线：.decoration({ type: ... })
          //   Row 的 onClick 调用 this.toggleTodo(item.id)
          // TODO 5: ForEach 第三参数返回唯一键（用 id）
        })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}