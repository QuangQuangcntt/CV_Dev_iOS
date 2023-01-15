//
//  TXT_Keyboard.swift
//  ViewBuilder
//
//  Created by Quang Tran on 12/12/2022.
//
//TUTORIAL
//https://morioh.com/p/030711bdb538

//https://stackoverflow.com/questions/57739966/how-to-make-the-bottom-button-follow-the-keyboard-display-in-swiftui/57743709#57743709

import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
    let willset = PassthroughSubject<CGFloat, Never>()
    private var _center: NotificationCenter
    @Published var currentHeight: CGFloat = 0
    var keyboardDuration: TimeInterval = 0

    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        _center.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            guard let duration:TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
            keyboardDuration = duration

            DispatchQueue.main.async { [self] in
                withAnimation(.easeInOut(duration: duration)) {
                    self.currentHeight = keyboardSize.height
                }
            }
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        guard let duration:TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }

        DispatchQueue.main.async { [self] in
            withAnimation(.easeInOut(duration: duration)) {
                currentHeight = 0
            }
        }
    }
}

//struct KeyboardView<Content, ToolBar> : View where Content : View, ToolBar: View {
//    @StateObject private var keyboard: KeyboardResponder = KeyboardResponder()
//
//    var content: () -> Content
//    var toolBar: () -> ToolBar
//
//    var body: some View {
//        ZStack {
//            content()
//
//            VStack(alignment: .center, spacing: 0) {
//                
//                 Spacer()
//                
//                 toolBar()
//                    .frame(maxWidth: WV, maxHeight: 40)
//                    .background(Color.gray)
//                
////                Spacer()
////                    .frame(height: keyboard.currentHeight)
//                
//            }
//            .opacity((keyboard.currentHeight == 0) ? 0 : 1)
//            .animation(.easeOut)
//            //.padding(.bottom, keyboard.currentHeight)
//        }
//       // .edgesIgnoringSafeArea(.bottom)
//    }
//}
