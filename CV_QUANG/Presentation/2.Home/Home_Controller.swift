//
//  Home_Controller.swift
//  CV_Quang_IOS
//
//  Created by Quang Tran on 13/01/2023.
//

import Foundation

extension Home_View {
    
    func onAppearProcess(){
        
        arrDataSkill.append(dataSkill(title: "Main skills",
                                      mainData: [skillName(title: "SwiftUI", icon: "https://i.imgur.com/or5XvDq.png"),
                                                 skillName(title: "Cocoa pods", icon: "https://i.imgur.com/j7Tyqe9.png"),
                                                 skillName(title: "RESTful API", icon: "https://i.imgur.com/xn6Knwe.jpg"),
                                                 skillName(title: "App Life Cycle", icon: "https://i.imgur.com/bjVOtKS.png"),
                                                 skillName(title: "Sync / Async", icon: "https://i.imgur.com/m8H1n0H.png"),
                                                 skillName(title: "JWT", icon: "https://i.imgur.com/6RXRvPn.png"),
                                                 skillName(title: "Firebase", icon: "https://i.imgur.com/g27WsGy.png"),
                                                 skillName(title: "Lottie", icon: "https://i.imgur.com/p7Gusa7.png")]))
        
        arrDataSkill.append(dataSkill(title: "Languages",
                                      mainData: [skillName(title: "Vietnamese", icon: "https://i.imgur.com/1cU61R8.png"),
                                                 skillName(title: "English", icon: "https://i.imgur.com/ySZzwFq.png")
//                                                 skillName(title: "Swift\nLanguage", icon: "https://i.imgur.com/JYykqvu.png")
                                                ]))
        
        arrDataSkill.append(dataSkill(title: "Personal Skills",
                                      mainData: [skillName(title: "Highly motivated", icon: "https://i.imgur.com/YAW9n9V.jpg"),
                                                 skillName(title: "Searching information", icon: "https://i.imgur.com/YZCmsEp.png"),
                                                 skillName(title: "Algorithms", icon: "https://i.imgur.com/g2UqyJt.png"),
                                                 skillName(title: "Teamwork", icon: "https://i.imgur.com/JW6wsyO.png"),
                                                 skillName(title: "Fluent in English", icon: "https://i.imgur.com/K8iZ9i8.png"),
                                                 skillName(title: "Swimming", icon: "https://i.imgur.com/0nv9a9e.png")]))
    }
}
