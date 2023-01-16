//
//  Home_VARIABLE.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import SwiftUI

struct Home_View: View {
    
    @ObservedObject var TABBAR: tabbarState
    
    @State var config_Base = dataConfig_BaseView(isShowDrag: true,
                                                 SwipeBackOption: .none)
    
    //MARK: - MAIN CONTENT
    
    struct skillName: Hashable {
        var ID = UUID().uuidString
        var title: String = ""
        var icon: String = ""
    }
    
    struct dataSkill: Hashable {
        var ID = UUID().uuidString
        var title: String = ""
        var mainData: [skillName] = []
    }
    
    @State var arrDataSkill: [dataSkill] = []
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
}
