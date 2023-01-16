//
//  BaseView_VARIABLE.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import Foundation
import SwiftUI

enum typeSwipeBack {
    case defaule // using dismiss for back to previous view
    case special // using function back build-in
    case none  // do not allow swipe back gesture
}

struct dataConfig_BaseView{
    var isShowDrag: Bool = true
    var SwipeBackOption: typeSwipeBack = .defaule
}

struct Base_View<Content>: View where Content: View {
    
    let content: Content
    
    @Binding var config_Base: dataConfig_BaseView
    
    var func_Swipe_Back: () -> Void
    
    @StateObject var keyboard: KeyboardResponder = KeyboardResponder()
    
    @State var offSetView: CGFloat = 0
    
    //Dismiss view - back to previous
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var dragAmount: CGPoint = CGPoint(x: WV*0.9, y: HV*0.7)
}
