//
//  DNBCnet_View.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 22/03/2022.
//

import SwiftUI

struct DNBCnet_View: View {
    
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
        Technology_Name(title: "KingFisher", icon: "KingFisher"),
        Technology_Name(title: "Lottie", icon: "Lottie"),
        Technology_Name(title: "GoogleMap", icon: "GoogleMap"),
        Technology_Name(title: "PhoneNumberkit", icon: "PhoneNumberkit"),
        Technology_Name(title: "Boyer Moore algorithm", icon: "Algorithms"),
        Technology_Name(title: "Fuzzy search algorithm", icon: "Algorithms"),
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

            }
            .padding(.vertical, 16)
        }
        .navigationBarHidden(false)
        .navigationBarTitle("DNBCnet", displayMode: .large) // ⬅️ Important part
        .colorNavigation
        .background(Color(hex: 0xFCFAF7))
        
    }
}
