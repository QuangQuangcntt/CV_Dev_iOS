//
//  Project_detail_Main_Content.swift
//  CV_QUANG
//
//  Created by Quang Tran on 15/01/2023.
//

import SwiftUI

struct Project_detail_Main_Content: View {
    
    @Binding var project_detail: data_project
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Spacer()
                .frame(height: 128)
 
            HStack(alignment: .center, spacing: 0) {

                Text("Team size :  ")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: Font().Size24()))
                
                + Text(project_detail.teamSize)
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Italic(), size: Font().Size16()))

                Spacer()
                
            }.padding(.all, 16)
            
            HStack(alignment: .center, spacing: 0) {

                Text("Technology")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: Font().Size24()))
                
                Spacer()
            }.padding(.all, 16)
            
            StaggeredGrid(columns: 3, spacing: 0,
                          list: .constant(project_detail.arrTech),
                          isLazy: true, content: { sub in
                
                VStack(alignment: .center, spacing: 8){
                    
                    //Image here
                    
                    AsyncImage_Advance(resizeFor: .universal,
                                       isLazy: false,
                                       url: URL(string: sub.img) ?? URL(string: "-")!,
                                       placeholder: {
                        IMG_Indicator()
                    })
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36, alignment: .center)
                    
                    Text(sub.title)
                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                        .font(.custom(Font().Regular(), size: Font().Size14()))
                }
            }).padding(.all, 16)
            
            HStack(alignment: .center, spacing: 0) {

                Text("Main Responsitory")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: Font().Size24()))
                
                Spacer()
            }.padding(.all, 16)
            
            Text(project_detail.mainResponse)
                .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                .font(.custom(Font().LightItalic(), size: Font().Size14()))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(8)
                .padding(.all, 16)
            
            HStack(alignment: .center, spacing: 0) {

                Text("Is this project on app store ?")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().Title(), size: Font().Size24()))
                
                Spacer()
            }.padding(.all, 16)
            
            if project_detail.URL_app.trimWhiteSpace() != "" &&
                project_detail.URL_app.trimWhiteSpace() != "no"{
                Button{
                    if let url = URL(string: project_detail.URL_app.trimWhiteSpace()) {
                        UIApplication.shared.open(url)
                    }
                }label: {
                        
                    Text("View Project")
                        .foregroundColor(Color.white)
                        .font(.custom(Font().Italic(), size: Font().Size14()))
                        .padding(.vertical, 8).padding(.horizontal, 12)
                        .background(
                            Color(hex: CIManager().TextColor_Pink())
                        )
                        .cornerRadius(20)
                        .shadow(color: Color(hex: CIManager().TextColor_Pink(), alpha: 0.8), radius: 8, x: 4, y: 4)
                        .padding(.horizontal, 16)
                }
            }
            else if project_detail.URL_app.trimWhiteSpace() == "no" {
                Text("This project is never on app store")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().LightItalic(), size: Font().Size14()))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(8)
                    .padding(.all, 16)
            }
            else{
                Text("This project was on app store. And not available now")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().LightItalic(), size: Font().Size14()))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(8)
                    .padding(.all, 16)
            }
        }
        .padding(.bottom, 100)
    }
}
