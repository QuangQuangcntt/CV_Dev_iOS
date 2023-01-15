//
//  Tabbar_Custom_Project.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import SwiftUI

struct Tabbar_Project_BTN: View {

    @ObservedObject var TABBAR: tabbarState
    
    @State var isProject: Bool = false
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 0, content: {
            
           

            ZStack(alignment: .center){
                
                VStack(alignment: .center, spacing: 0){
                    
                    Spacer()
                    
                    Text("Project_Tabbar", bundle: settings.bundle)
                        .foregroundColor(Color(hex: isProject ? 0xF5B433 : 0x231f20))
                        .font(.custom(isProject ? Font().Bold() : Font().Regular(), size: Font().Size11()))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .offset(x: -2, y: -2)
                }
                Rectangle()
                    .frame(width: 50, height: 60, alignment: .center)
                    .foregroundColor(Color.clear)
                
            }

            Spacer()
            
        })
        .onReceive(self.TABBAR.$click, perform: { value in
            if value == .Project {
                isProject = true
            }
            else {
                isProject = false
            }
        })
    }
}
