//
//  Project_View.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import SwiftUI

struct Project_View: View {
    
    //go to rootView
    @EnvironmentObject var appState: AppState
    
    //tabbar state
    @ObservedObject var selectType: tabbarState
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            
           
            VStack(alignment: .center, spacing: 0){
                
                Text("Project View")
                Text("Project View")
                Text("Project View")
                Text("Project View")
                Text("Project View")
                Text("Project View")
                Text("Project View")
            }
        }
        .padding(.top, 50)
        .frame(width: WV, alignment: .center)// not set height: -> Auto height
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(Color(hex: 0xFCFAF7))
    }
}
