//
//  Korean_View.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 23/03/2022.
//

import SwiftUI

struct Korean_View: View {
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    struct Technology_Name: Hashable {
        var title: String = ""
        var icon: String = ""
    }
    
    @State var arrTech: [Technology_Name] = [
        Technology_Name(title: "Swift - UIKit", icon: "Swift_UIKit"),
        Technology_Name(title: "Realm database", icon: "Realm"),
        Technology_Name(title: "File Manager", icon: "JWT"),
        
        Technology_Name(title: "MLCore", icon: "MLCore"),
        
    ]
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 0){
            
                
                HStack(alignment: .center, spacing: 0) {

                    Text("Team size :  ")
                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                        .font(.custom(Font().Title(), size: Font().Size24()))
                    
                    + Text("Two students")
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
                
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    ForEach(arrTech, id: \.self) { sub in
                        
                        VStack(alignment: .center, spacing: 8){
                            
                            //Image here
                            
                            Image(sub.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 36, height: 36, alignment: .center)
                                .cornerRadius(20)
                            
                            Text(sub.title)
                                .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                                .font(.custom(Font().Regular(), size: Font().Size14()))
                        }
                    }
                }.padding(.vertical, 16)
                
                HStack(alignment: .center, spacing: 0) {

                    Text("Main Responsitory")
                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                        .font(.custom(Font().Title(), size: Font().Size24()))
                    
                    Spacer()
                }.padding(.all, 16)
                
                Text("This app is made by me. My friend made nodeJS server side and MongoDB")
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
                
                Text("This project is never on app store")
                    .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                    .font(.custom(Font().LightItalic(), size: Font().Size14()))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(8)
                    .padding(.all, 16)
                
                

            }
            .padding(.vertical, 16)
        }
        .navigationBarHidden(false)
        .navigationBarTitle("Korean Language", displayMode: .large) // ⬅️ Important part
        .colorNavigation
        .background(Color(hex: 0xFCFAF7))
        
    }
}
