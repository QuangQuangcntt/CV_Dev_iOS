//
//  OneIBC.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 23/03/2022.
//

import SwiftUI

struct OneIBC: View {
    
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
        Technology_Name(title: "SwiftUI", icon: "swiftUI"),
        Technology_Name(title: "Firebase", icon: "Firebase"),
        Technology_Name(title: "JWT", icon: "JWT"),
        
        Technology_Name(title: "OneSignal", icon: "OneSignal"),
        
        Technology_Name(title: "KingFisher", icon: "KingFisher"),
        Technology_Name(title: "Lottie", icon: "Lottie"),
        Technology_Name(title: "GoogleMap", icon: "GoogleMap"),
        Technology_Name(title: "PhoneNumberkit", icon: "PhoneNumberKit"),
        Technology_Name(title: "AppsFlyer", icon: "AppsFlyer"),
    ]
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 0){
            
                
                HStack(alignment: .center, spacing: 0) {

                    Text("Team size :  ")
                        .foregroundColor(Color(hex: CIManager().TextColor_Brown()))
                        .font(.custom(Font().Title(), size: Font().Size24()))
                    
                    + Text("once person (only me)")
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
                
                Text("Make all app, from start project to finish")
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
                
                Button{
                    if let url = URL(string: "itms-apps://apple.com/app/id1574638100") {
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
            .padding(.vertical, 16)
        }
        .navigationBarHidden(false)
        .navigationBarTitle("OneIBC Digital", displayMode: .large) // ⬅️ Important part
        .colorNavigation
        .background(Color(hex: 0xFCFAF7))
        
    }
}

