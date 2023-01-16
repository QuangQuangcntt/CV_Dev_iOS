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
 
    @State var isProjectDetail: Bool = false
    
    @State var project_detail: data_project = data_project()
}


//content detail

struct technology: Hashable {
    var ID = UUID().uuidString
    var title: String = ""
    var img: String = ""
}

struct data_project {
    var title: String = ""
    var teamSize: String = ""
    var arrTech: [technology] = []
    var mainResponse: String = ""
    var URL_app: String = ""
}
