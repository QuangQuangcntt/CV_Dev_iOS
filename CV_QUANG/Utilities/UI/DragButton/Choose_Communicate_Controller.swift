//
//  Choose_Communicate_Controller.swift
//
//  Created by TUHAO on 07/12/2021.
//

import Foundation
import SwiftUI

extension Choose_Communicate {

    func openAppAction(info: phoneInfor){
        
        let linkURL = info.link
        
        guard let link = URL(string: linkURL) else { return }
        if UIApplication.shared.canOpenURL(link){
            print(info.name + " link: " + linkURL)
            UIApplication.shared.open(link)
        }else{
            //redirect to app store because the user doesn't have app installed
            
            if info.name.lowercased() == "zalo"{
                if let url = URL(string: "itms-apps://apple.com/app/id579523206") {
                    UIApplication.shared.open(url)
                }
            }
            
            if info.name.lowercased() == "messenger"{
                if let url = URL(string: "itms-apps://apple.com/app/id454638411") {
                    UIApplication.shared.open(url)
                }
            }
            if info.name.lowercased() == "linkedin"{
                if let url = URL(string: "itms-apps://apple.com/app/id686449807") {
                    UIApplication.shared.open(url)
                }
            }
        }

    }
}
