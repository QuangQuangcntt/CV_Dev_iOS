//
//  Tabbar_View.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 11/01/2023.
//

import SwiftUI

extension Tabbar_View {

    var body: some View {
        
        ZStack {
            
            Home_View(TABBAR: TABBAR)
                .offset(x: TABBAR.click == .Home ? 0 : -WV*1.1)
                .opacity(TABBAR.click == .Home ? 1 : 0)
            
            Project_View(TABBAR: TABBAR)
                .opacity(TABBAR.click == .Project ? 1 : 0)
            
            Contact_View(TABBAR: TABBAR)
                .offset(x: TABBAR.click == .Contact ? 0 : WV*1.1)
                .opacity(TABBAR.click == .Contact ? 1 : 0)
                
            
            VStack(alignment: .center, spacing: 0){
                
                Spacer()
                
                Tabbar_ButtonUI(TABBAR: TABBAR)
                
            }.edgesIgnoringSafeArea(.bottom)
            
            if isLostInternet {
                LostInternetConnection(isLostInternet: $isLostInternet,
                                       internetMonitor: monitor)
            }
        }
        .onChange(of: scenePhase) { phase in
           
            switch phase {
                case .active:
                    print(">> your code is here on scene become active")
                case .inactive:
                    print(">> your code is here on scene become inactive")
                case .background:
                    print(">> your code is here on scene go background")
                default:
                    print(">> do something else in future")
                    
            }
        }
        .onAppear(){
            #if DEBUG
                print("DEBUG")
            #elseif RELEASE
                print("RELEASE")
            #endif
            
            if isFirstRunScreen{
                
                isFirstRunScreen = false
                
                CheckInternetConnection()
            }
        }
        .onReceive(self.monitor.$status, perform: { value in
            
            if value == .disconnected && isLostInternet == false{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    isLostInternet = true
                }
                
            }
            print("INTERNET: \(value.rawValue)")
        })
    }
}
