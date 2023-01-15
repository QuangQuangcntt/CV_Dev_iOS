//
//  OneIBC_VARIABLE.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 14/01/2023.
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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //ANIMATION
    
    @State var currentPos: CGFloat = 0.0
    
    @State var xLabel: CGFloat = 16
    
    @State var yLabel: CGFloat = 80
    
    @State var zoom: CGFloat = 1
    
    @State var showSmallTitle: Bool = false
    
    //@State var txtSIZE: CGFloat = 40
    
    @State var config_Base = dataConfig_BaseView(isShowDrag: true,
                                                 SwipeBackOption: .defaule)
}
