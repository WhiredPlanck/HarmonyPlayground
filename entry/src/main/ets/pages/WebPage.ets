import { webview } from '@kit.ArkWeb'

@Preview
@Component
export struct WebPage {
  webviewController: webview.WebviewController = new webview.WebviewController()
  @State address: string | undefined = undefined
  @State addressBarClickCount: number = 0
  @State loadProgress: number = 0
  pageEndTimer: number | undefined = undefined

  build() {
    Column({ space: 8 }) {
      Flex({
        direction: FlexDirection.Row,
        alignItems: ItemAlign.Center
      }) {
        TextInput({ text: this.address, placeholder: 'Enter the address' })
          .margin({ left: 8, right: 4 })
          .onChange((value: string) => {
            this.address = value
          })
          .onSubmit(() => {
            this.webviewController.loadUrl(this.address ?? '')
          })
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Image($r('app.media.ic_public_arrow_left_filled'))
            .width(24)
            .height(24)
        }
        .backgroundColor(0x317aff)
        .margin({ left: 4, right: 4 })
        .width(48)
        .height(48)
        .onClick(() => {
          this.webviewController.backward()
        })

        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Image($r('app.media.ic_public_arrow_right_filled'))
            .width(24)
            .height(24)
        }
        .backgroundColor(0x317aff)
        .margin({ left: 4, right: 4 })
        .width(48)
        .height(48)
        .onClick(() => {
          this.webviewController.forward()
        })

        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Image($r('app.media.ic_public_search_filled'))
            .width(24)
            .height(24)
        }
        .margin({ left: 4, right: 8 })
        .width(48)
        .height(48)
        .onClick(() => {
          this.webviewController.loadUrl(this.address ?? '')
        })
      }.margin({ top: 8 })

      Progress({ value: this.loadProgress, total: 100 })
      Web({ src: '', controller: this.webviewController })
        .onProgressChange((event) => {
          if (event) {
            this.loadProgress = event.newProgress
            if (this.loadProgress == 100) {
              clearTimeout(this.pageEndTimer)
              this.pageEndTimer = setTimeout(() => {
                this.loadProgress = 0
              }, 500)
            }
          }
        })
        .onTitleReceive(() => {
          this.address = this.webviewController.getUrl()
        })
    }
    .width('100%')
    .height('100%')
  }
}