//
//  General_View_Controller.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 22/03/2022.
//

import Foundation

extension General_View {
    
    func onAppearProcess(){
        
        arrDataSkill.append(dataSkill(title: "Main skills",
                                      mainData: [skillName(title: "SwiftUI", icon: "swiftUI"),
                                                 skillName(title: "Cocoa pods", icon: "cocoapods"),
                                                 skillName(title: "RESTful API", icon: "Restfulapi"),
                                                 skillName(title: "App Life Cycle", icon: "AppLifeCycle"),
                                                 skillName(title: "Sync / Async", icon: ""),
                                                 skillName(title: "JWT", icon: ""),
                                                 skillName(title: "Firebase", icon: ""),
                                                 skillName(title: "Lottie", icon: "")],
                                      type: .mainSkill))
        
        arrDataSkill.append(dataSkill(title: "Languages",
                                      mainData: [skillName(title: "Vietnamese", icon: "vietnam"),
                                                 skillName(title: "English", icon: "united-states")],
                                      type: .language))
        
        arrDataSkill.append(dataSkill(title: "Personal Skills",
                                      mainData: [skillName(title: "Highly motivated", icon: ""),
                                                 skillName(title: "Searching information", icon: ""),
                                                 skillName(title: "Algorithms", icon: ""),
                                                 skillName(title: "Teamwork", icon: ""),
                                                 skillName(title: "Fluent in English", icon: ""),
                                                 skillName(title: "Swimming", icon: "")],
                                      type: .PersonalSkill))
    }
}
