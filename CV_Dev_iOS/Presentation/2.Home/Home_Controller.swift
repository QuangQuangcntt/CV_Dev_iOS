//
//  Home_Controller.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 13/01/2023.
//

import Foundation

extension Home_View {
    
    func onAppearProcess(){
        
        arrDataSkill.append(dataSkill(title: "Home_main_Skill",
                                      mainData: [skillName(title: "SwiftUI", icon: "https://i.imgur.com/or5XvDq.png"),
                                                 skillName(title: "Cocoa pods", icon: "https://i.imgur.com/j7Tyqe9.png"),
                                                 skillName(title: "RESTful API", icon: "https://i.imgur.com/xn6Knwe.jpg"),
                                                 skillName(title: "App Life Cycle", icon: "https://i.imgur.com/bjVOtKS.png"),
                                                 skillName(title: "Sync / Async", icon: "https://i.imgur.com/m8H1n0H.png"),
                                                 skillName(title: "JWT", icon: "https://i.imgur.com/6RXRvPn.png"),
                                                 skillName(title: "Firebase", icon: "https://i.imgur.com/g27WsGy.png"),
                                                 skillName(title: "Lottie", icon: "https://i.imgur.com/p7Gusa7.png")]))
        
        arrDataSkill.append(dataSkill(title: "Home_languages",
                                      mainData: [skillName(title: "Home_languages_VN", icon: "https://i.imgur.com/1cU61R8.png"),
                                                 skillName(title: "Home_languages_EN", icon: "https://i.imgur.com/ySZzwFq.png")
//                                                 skillName(title: "Swift\nLanguage", icon: "https://i.imgur.com/JYykqvu.png")
                                                ]))
        
        arrDataSkill.append(dataSkill(title: "Home_Personal_Skills",
                                      mainData: [skillName(title: "Home_PS_Motivated", icon: "https://i.imgur.com/YAW9n9V.jpg"),
                                                 skillName(title: "Home_PS_Searching", icon: "https://i.imgur.com/YZCmsEp.png"),
                                                 skillName(title: "Home_PS_Algorithms", icon: "https://i.imgur.com/g2UqyJt.png"),
                                                 skillName(title: "Home_PS_Teamwork", icon: "https://i.imgur.com/JW6wsyO.png"),
                                                 skillName(title: "Home_PS_Fluent", icon: "https://i.imgur.com/K8iZ9i8.png"),
                                                 skillName(title: "Home_PS_Swimming", icon: "https://i.imgur.com/0nv9a9e.png")]))
    }
}
