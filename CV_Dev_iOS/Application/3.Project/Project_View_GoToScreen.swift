//
//  Project_View_GoToScreen.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 22/03/2022.
//

import SwiftUI

struct Project_View_GoToScreen: View {
    
    @Binding var isDNBCnet: Bool
    
    var body: some View {
        
        NavigationLink(destination: DNBCnet_View(), isActive: $isDNBCnet)
        { EmptyView() }.isDetailLink(false)
    }
}

