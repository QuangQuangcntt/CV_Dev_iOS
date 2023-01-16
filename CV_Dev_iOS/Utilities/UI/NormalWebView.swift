import SwiftUI
import WebKit

struct NormalWebView : UIViewRepresentable {

    let isScroll: Bool
    let htmlString: String
    
    
    init(isScroll: Bool, htmlString: String) {
        self.isScroll = isScroll
        self.htmlString = htmlString     
    }
       
      func makeUIView(context: Context) -> WKWebView {
        return WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
      }
       
      func updateUIView(_ uiView: WKWebView, context: Context) {
          uiView.scrollView.isScrollEnabled = isScroll
          uiView.isUserInteractionEnabled = true
          if htmlString != "" {
              uiView.loadHTMLString(htmlString, baseURL: nil)
          }
      }
}
