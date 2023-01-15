//
//  Project_detail_Top_Banner.swift
//  CV_QUANG
//
//  Created by Quang Tran on 15/01/2023.
//

import SwiftUI

struct Project_detail_Top_Banner: View {
    
    @Binding var project_detail: data_project
    
    @Binding var showSmallTitle: Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
         
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(height: 80)
                
               
                Text(project_detail.title)
//                    .font(.custom("", size: txtSIZE))
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: 28))
                    .offset(y: 16)
                    .opacity(showSmallTitle ? 1 : 0)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(alignment: .center, spacing: 0){
                        
                        Text("< Back")
                            .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                            .font(.custom(Font().Bold(), size: Font().Size16()))
                        
                        Spacer()
                    }
                }.padding(.all, 16).padding(.top, 32)

            }
           
            
            
            Spacer()
        }
    }
}
