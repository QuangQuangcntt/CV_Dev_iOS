//
//  Contact_View_Controller.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 24/03/2022.
//

import Foundation
import SwiftUI

extension Contact_View {
    
    func onAppearContactView(){
        
        
        arrDataInfor.append(inforContact(title: "Basic Infor", arrInfor_Data:
                                            [Infor(title: "Phone",
                                                   content: "091 885 15 29",
                                                   type: .phone),
                                             Infor(title: "Email",
                                                   content: "tmqcntt@gmail.com",
                                                   type: .email),
                                             Infor(title: "Address",
                                                   content: "Nghia Phat Street, 6 ward, Tan Binh Distric, Ho Chi Minh city",
                                                   type: .address)]
                                        ))
        
        arrDataInfor.append(inforContact(title: "Social network", arrInfor_Data:
                                            [Infor(title: "Facebook",
                                                   content: "https://www.facebook.com/quang.quang.098",
                                                   type: .link),
                                             Infor(title: "Linkedin",
                                                   content: "https://www.linkedin.com/in/quang-tran-cntt",
                                                   type: .link),
                                             Infor(title: "Github",
                                                   content: "https://www.github.com/QuangQuangcntt",
                                                   type: .link)]
                                        ))
    }
    
    func contactAction(type: Contact_View.Infor){
        
        if type.type == .phone{
            let urlPhone = "tel:\(type.content.replacingOccurrences(of: " ", with: ""))"

            guard let link = URL(string: urlPhone) else { return }
            
            
            if UIApplication.shared.canOpenURL(link){
                UIApplication.shared.open(link)
            }
        }
        else if type.type == .link{
            
            //avoid null
            if type.content.contains("http") {
                openURL(URL(string: type.content)!)
            }
        }
    }
}
