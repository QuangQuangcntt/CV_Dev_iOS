//
//  General_View_Controller.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 21/03/2022.
//

import Foundation
import SwiftUI

extension Project_View {
    
    func setupData(){
        
        arrExperience.append(dataExperience(time: "05 / 2019 - 11 / 2019",
                                            company: "TNHH TRÍ KHẢI TECHNOLOGYS",
                                            position: "Internship",
                                            Project: "Secret Vault",
                                            description: "Application protect secret image and contact information"))
                                           
        
        arrExperience.append(dataExperience(time: "12 / 2019 - 12 / 2020",
                                            company: "University of Technology and Education (HCMUTE)",
                                            position: "Student",
                                            Project: "Korean language app (For graduate thesis)",
                                            description: "Application help users learn Korean language using machine learning"))
                                  
        arrExperience.append(dataExperience(time: "01 / 2021 - 10/2021",
                                            company: "BIN Coporation Group",
                                            position: "Staff",
                                            Project: "DNBCnet",
                                            description: "Fintech Application"))
        
        arrExperience.append(dataExperience(time: "10 / 2021 - now",
                                            company: "BIN Coporation Group",
                                            position: "Staff",
                                            Project: "OneIBC Digital",
                                            description: "Application help setting up an offshore company"))
        
        
        
    }
    
    func goToScreen(project: String){
        
        switch project{
            
            case "Secret Vault":
            
                project_detail = data_project(title: "Secret Vault",
                                       teamSize: "Two staffs",
                                       arrTech: [technology(title: "Swift - UIKit", img: "https://i.imgur.com/qd6OtrP.png"),
                                                 technology(title: "Realm database", img: "https://i.imgur.com/opzQSZ8.png"),
                                                 technology(title: "File Manager", img: "https://i.imgur.com/6RXRvPn.png"),
                                                 technology(title: "Firebase", img: "https://i.imgur.com/g27WsGy.png")],
                                       mainResponse: "Made UI home screen",
                                       URL_app: "")

            case "Korean language app (For graduate thesis)":
            
                project_detail = data_project(title: "Korean Language",
                                       teamSize: "Two students",
                                       arrTech: [technology(title: "Swift - UIKit", img: "https://i.imgur.com/qd6OtrP.png"),
                                                 technology(title: "Realm database", img: "https://i.imgur.com/opzQSZ8.png"),
                                                 technology(title: "File Manager", img: "https://i.imgur.com/6RXRvPn.png"),
                                                 technology(title: "MLCore", img: "https://i.imgur.com/tj6MOEz.png")],
                                       mainResponse: "This app is made by me. My friend made nodeJS server side and MongoDB",
                                       URL_app: "no")

            case "DNBCnet":
            
                project_detail = data_project(title: "DNBC digital",
                                       teamSize: "one person (only me)",
                                       arrTech: [technology(title: "SwiftUI", img: "https://i.imgur.com/or5XvDq.png"),
                                                 technology(title: "Firebase", img: "https://i.imgur.com/g27WsGy.png"),
                                                 technology(title: "JWT", img: "https://i.imgur.com/6RXRvPn.png"),
                                                 technology(title: "KingFisher", img: "https://i.imgur.com/t17jklu.png"),
                                                 technology(title: "Lottie", img: "https://i.imgur.com/p7Gusa7.png"),
                                                 technology(title: "GoogleMap", img: "https://i.imgur.com/l2QxvAA.png"),
                                                 technology(title: "PhoneNumberKit", img: "https://i.imgur.com/WmcoKr0.png"),
                                                 technology(title: "Boyer Moore algorithm", img: "https://i.imgur.com/g2UqyJt.png"),
                                                 technology(title: "Fuzzy search algorithm", img: "https://i.imgur.com/g2UqyJt.png")],
                                       mainResponse: "Made all app, from start to finish",
                                       URL_app: "itms-apps://apple.com/app/id1536242101")
            case "OneIBC Digital":
            
                project_detail = data_project(title: "OneIBC digital",
                                       teamSize: "one person (only me)",
                                       arrTech: [technology(title: "SwiftUI", img: "https://i.imgur.com/or5XvDq.png"),
                                                 technology(title: "Firebase", img: "https://i.imgur.com/g27WsGy.png"),
                                                 technology(title: "JWT", img: "https://i.imgur.com/6RXRvPn.png"),
                                                 technology(title: "KingFisher", img: "https://i.imgur.com/t17jklu.png"),
                                                 technology(title: "Lottie", img: "https://i.imgur.com/p7Gusa7.png"),
                                                 technology(title: "GoogleMap", img: "https://i.imgur.com/l2QxvAA.png"),
                                                 technology(title: "PhoneNumberKit", img: "https://i.imgur.com/WmcoKr0.png"),
                                                 technology(title: "AppsFlyer", img: "https://i.imgur.com/uRbnzyY.png")],
                                       mainResponse: "Made all app, from start to finish",
                                       URL_app: "itms-apps://apple.com/app/id1574638100")

            default: project_detail = data_project()
           
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            isProjectDetail = true
        }
        
    }
}
