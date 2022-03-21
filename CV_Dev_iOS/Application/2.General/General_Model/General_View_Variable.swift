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
    
    struct dataExperience: Hashable {
        var time: String = ""
        var company: String = ""
        var position: String = ""
        var Project: String = ""
        var description: String = ""
    }
    
    @State var arrExperience: [dataExperience] = []
}
