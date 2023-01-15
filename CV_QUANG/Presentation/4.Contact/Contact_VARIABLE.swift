//
//  Contact_Variab;e.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 13/01/2023.
//

import SwiftUI

struct Contact_View: View {
    
    @ObservedObject var TABBAR: tabbarState
    
    @State var config_Base = dataConfig_BaseView(isShowDrag: true,
                                                 SwipeBackOption: .none)
    @State var isLanguage: Bool = false
    
    enum typeInfor {
        case phone
        case email
        case link
        case address
    }
    
    struct Infor: Hashable {
        var title: String = ""
        var content: String = ""
        var type: typeInfor = .phone
    }
    
    struct inforContact: Hashable {
        var title: String = ""
        var arrInfor_Data: [Infor] = []
    }
    
    @State var arrDataInfor: [inforContact] = []
    
    @Environment(\.openURL) var openURL
    
    @State var arrFeatures: [String] = ["contact_1",
                                        "contact_2",
                                        "contact_3",
                                        "contact_4",
                                        "contact_5"]
}
