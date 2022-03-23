//
//  Project_View_GoToScreen.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 22/03/2022.
//

import SwiftUI

struct Project_View_GoToScreen: View {
    
    @Binding var isSecretVault: Bool
    
    @Binding var isKoreanApp: Bool
    
    @Binding var isDNBCnet: Bool
    
    @Binding var isOneIBC: Bool
    
    var body: some View {
        
        
        
        NavigationLink(destination: SecretVault_View(), isActive: $isSecretVault)
        { EmptyView() }.isDetailLink(false)
        
        NavigationLink(destination: Korean_View(), isActive: $isKoreanApp)
        { EmptyView() }.isDetailLink(false)
        
        NavigationLink(destination: DNBCnet_View_LargeLogoBar(), isActive: $isDNBCnet)
        { EmptyView() }.isDetailLink(false)
        
        NavigationLink(destination: OneIBC_View_LargeLogoBar(), isActive: $isOneIBC)
        { EmptyView() }.isDetailLink(false)
        
        
        
        
    }
}

