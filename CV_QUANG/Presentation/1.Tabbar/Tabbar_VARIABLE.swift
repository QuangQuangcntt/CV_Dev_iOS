//
//  Tabbar_VARIABLE.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import SwiftUI

enum clickTYPE {
    case Home
    case Project
    case Contact
}

public class tabbarState : ObservableObject{
    @Published var click: clickTYPE = .Home
}

struct Tabbar_View: View {
    
    @StateObject var TABBAR: tabbarState = tabbarState()
    
    @State var shouldScroll: Bool = false
    
    var axes: Axis.Set {
        return shouldScroll ? .horizontal : []
    }
    
    @State var dragOffset: CGFloat = 0.0
    
    @Environment(\.scenePhase) var scenePhase
    
    @EnvironmentObject var monitor: Monitor_Internet
    
    @State var isFirstRunScreen: Bool = true
    
    @State var isLostInternet: Bool = false
}
