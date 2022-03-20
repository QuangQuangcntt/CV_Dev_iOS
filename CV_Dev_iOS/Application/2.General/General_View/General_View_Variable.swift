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
    
    struct dataExperience {
        var time: String = ""
        var title: String = ""
        var Skill: String = ""
        var Project: String = ""
        var purpose: String = ""
        var tech: [String] = []
    }
    
    @State var arrExperience: [dataExperience] = []
}
