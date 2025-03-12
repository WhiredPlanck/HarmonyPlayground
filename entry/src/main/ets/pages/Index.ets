@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(36)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      TextInput({ placeholder: 'Single line input'})
        .id('SingleLine')
        .alignRules({
          top: { anchor: 'HelloWorld', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .margin({ left: 10, top: 10, right: 10, bottom: 10 })
      TextArea({ placeholder: 'Multiple line input' })
        .id('MultiLine')
        .alignRules({
          top: { anchor: 'SingleLine', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .margin({ left: 10, top: 10, right: 10, bottom: 10 })
    }
    .height('100%')
    .width('100%')
  }
}