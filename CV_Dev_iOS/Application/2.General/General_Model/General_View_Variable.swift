//
//  General_View_Variable.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import Foundation
import SwiftUI

struct General_View {
    
    //go to rootView
    @EnvironmentObject var appState: AppState
    
    //tabbar state
    @ObservedObject var selectType: tabbarState
    
    enum typeIcon {
        case mainSkill
        case language
        case PersonalSkill
    }
    
    struct skillName: Hashable {
        var title: String = ""
        var icon: String = ""
    }
    
    struct dataSkill: Hashable {
        var title: String = ""
        var mainData: [skillName] = []
        var type: typeIcon = .mainSkill
    }
    
    @State var arrDataSkill: [dataSkill] = []
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
}
