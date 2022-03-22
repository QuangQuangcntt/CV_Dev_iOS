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
                                            Project: "OneIBC Digital",
                                            description: "Application help setting up an offshore company"))
        
        
        arrExperience.append(dataExperience(time: "11 / 2021 - Now",
                                            company: "BIN Coporation Group",
                                            position: "Staff",
                                            Project: "DNBCnet",
                                            description: "Fintech Application"))
    }
    
    func goToScreen(project: String){
        
        switch project{
            
            case "DNBCnet":
                isDNBCnet = true
            default:
                isDNBCnet = true
        }
        
    }
}
