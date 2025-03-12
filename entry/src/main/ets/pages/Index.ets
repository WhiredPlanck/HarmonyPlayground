import { TextInputPage } from './TextInputPage'
import { WebPage } from './WebPage'

@Entry
@Component
struct Index {
  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        TextInputPage()
      }.tabBar('TextInput')
      TabContent() {
        WebPage()
      }.tabBar('WebView')
    }
    .height('100%')
    .width('100%')
  }
}