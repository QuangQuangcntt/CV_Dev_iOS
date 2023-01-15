//
//  Project_VARIABLE.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 13/01/2023.
//

import SwiftUI

struct Project_View: View {
    
    @ObservedObject var TABBAR: tabbarState
    
    //go to rootView
    @EnvironmentObject var appState: AppState
    
    @State var config_Base = dataConfig_BaseView(isShowDrag: true,
                                                 SwipeBackOption: .none)
    
    
    //MAIN CONTENT
    struct dataExperience: Hashable {
        var time: String = ""
        var company: String = ""
        var position: String = ""
        var Project: String = ""
        var description: String = ""
    }
    
    @State var arrExperience: [dataExperience] = []
    
    @State var isSecretVault: Bool = false
    
    @State var isKoreanApp: Bool = false
    
    @State var isDNBCnet: Bool = false
    
    @State var isOneIBC: Bool = false
}
