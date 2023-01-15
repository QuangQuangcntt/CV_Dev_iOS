//
//  AsyncImage_Advance_Support.swift
//
//
//  Created by Quang Tran on 29/12/2022.
//

import Foundation
import SwiftUI

extension AsyncImage_Advance {
    
    func downloadTYPE(url: URL){
        let imgExtension = String(describing: url).components(separatedBy: ".").last ?? ".heic"
        
        //print("Image extension: \(imgExtension)")
        
        let imageNameFormURL = self.setImgName(url: "\(url)")

        print("Get image success: , URL: \(imageNameFormURL)")

        if url != URL(fileURLWithPath: ""){
            if imgExtension.lowercased() != "svg"{

                downloadImage(url: url)
            }
            else{
                download_SVG_Image(url: url)
            }
        }
    }
    
    func fetchImage(urlIMG: URL, data: Data){

        DispatchQueue.main.async {
            if urlIMG == URL(fileURLWithPath: "") {
                //not having any image
                self.stateLoad = .finish
            }
            else{
                do {
                    //MARK: - save Image to Folder
                    try data.write(to: urlIMG , options: .atomic )
                }
                catch{
                    print("Error, can not cache image")
                }
                
                // having image data, fetch image to UI and cache it
                if let dataIMG = self.loadImageThumnail(imageAt: urlIMG) {
                    self.IMG_Result = dataIMG
                    
                    self.stateLoad = .finish
                }
                else{
                    self.stateLoad = .empty
                }
            }
        }
    }
}
