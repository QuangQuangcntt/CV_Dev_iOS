//
//  CV_Quang_IOSApp.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import SwiftUI

@main
struct CV_Quang_IOSApp: App {
    var body: some Scene {
        WindowGroup {
           
            NavigationView {
                Tabbar_View()
                   
            }.environmentObject(AppState())
            .environmentObject(Monitor_Internet())
           
        }
    }
}
