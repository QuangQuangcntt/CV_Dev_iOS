//
//  AsyncImage_Advance_LoadImage.swift
//
//
//  Created by Quang Tran on 29/12/2022.
//

import Foundation
import SwiftUI

extension AsyncImage_Advance {

    func loadImage(url: URL) {
        
        self.lock.lock()
        
        defer{ self.lock.unlock() }
        
        if url != URL(string: "-") &&
            url.absoluteString.contains("https://") &&
            url != URL(string: ""){

            //MARK: - CHECK IF IMAGE EXIST IN LOCAL OR NOT
            let path = (NSSearchPathForDirectoriesInDomains(.cachesDirectory, .allDomainsMask, true).first ?? "") as String
            
            let url_Local = NSURL(fileURLWithPath: path)
            
            let imageNameFormURL = self.setImgName(url: "\(String(describing: url))")
            
            if let pathComponent =
                url_Local.appendingPathComponent(imageNameFormURL ) {
                
                let filePath = pathComponent.path

                if FileManager.default.fileExists(atPath: filePath) {

                    if let dataIMG = self.loadImageThumnail(imageAt: pathComponent) {
                        self.IMG_Result = dataIMG
                    }
                    
                    self.stateLoad = .finish
 
                } else {
                   // print("FILE NOT AVAILABLE")
                    self.downloadTYPE(url: url)
                }
            } else {
               // print("FILE PATH NOT AVAILABLE")
                //only download and show, can not save image
                self.downloadTYPE(url: url)
            }
        }
        else{
            self.stateLoad = .empty
        }
    }
}
