import { inputMethod } from "@kit.IMEKit"
import { BusinessError } from "@kit.BasicServicesKit"

@Component
export struct TextInputPage {
  build() {
    RelativeContainer() {
      Text('Hello World')
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
      Button('Show input method picker')
        .alignRules({
          top: { anchor: 'MultiLine', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .margin({ left: 10, top: 10, right: 10, bottom: 10 })
        .onClick(() => {
          const  inputMethodSetting = inputMethod.getSetting()
          try {
            inputMethodSetting.showOptionalInputMethods((err: BusinessError, data: boolean) => {
              if (err) return
            })
          } catch (err) {
          }
        })
    }
  }
}
