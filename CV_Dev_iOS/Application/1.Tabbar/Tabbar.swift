//
//  ContentView.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import SwiftUI

enum clickTYPE {
    case General
    case Project
    case Contact
}

public class tabbarState : ObservableObject{
    @Published var click: clickTYPE = .General
}

struct Tabbar: View {
    
    @StateObject var selectType: tabbarState = tabbarState()
    
    //SwiftUI: How to add Blur view with app logo when app in background?
    @Environment(\.scenePhase) var scenePhase
    @State var isBlur: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading){
            
            NavigationView {
                General_View(selectType: selectType)
                    .opacity(selectType.click == .General ? 1: 0)
                    .ignoresSafeArea(.container, edges: .top)    // totally hide navigation bar
            }
            .opacity(selectType.click == .General ? 1: 0)
            
            NavigationView {
                Project_View(selectType: selectType)
                    .navigationBarHidden(false)
                    .navigationBarTitle("Project", displayMode: .large) // ⬅️ Important part
                    .colorNavigation
            }
            .opacity(selectType.click == .Project ? 1: 0)
            
            NavigationView {
                
                Contact_View(selectType: selectType)
                    .navigationBarHidden(false)
                    .navigationBarTitle("Contact", displayMode: .large) // ⬅️ Important part
                    .colorNavigation
                  
                
            } .opacity(selectType.click == .Contact ? 1: 0)
            
            //MARK: - UI BUTTON TABBAR
            //
                                Tabbar_ButtonUI(selectType: selectType)
        }
        .background(Color(hex: 0xFCFAF7))
        .ignoresSafeArea(.all, edges: .bottom)
        .onChange(of: scenePhase) { phase in
            switch phase {
                case .active:
                    print(">> your code is here on scene become active")
                    DispatchQueue.main.async {
                        isBlur = false
                    }
                  
                case .inactive:
                    print(">> your code is here on scene become inactive")
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 0.3)){
                            isBlur = true
                        }
                    }
                case .background:
                    print(">> your code is here on scene go background")
                    isBlur = false
                default:
                    print(">> do something else in future")
                    DispatchQueue.main.async {
                        isBlur = false
                    }
            }
        } 
    }
}
