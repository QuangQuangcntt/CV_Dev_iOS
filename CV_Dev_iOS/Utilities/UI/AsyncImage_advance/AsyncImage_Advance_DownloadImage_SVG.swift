//
//  AsyncImage_Advance_DownloadImage_SVG.swift
//  OneIBC
//
//  Created by Quang Tran on 29/12/2022.
//

import Foundation
import SVGKit

extension AsyncImage_Advance {
    
    func download_SVG_Image(url: URL){

        var documentDirectory: URL?
       
        //avoid running duplicate
        
        // .cachesDirectory will save to "Library/Caches/" folder
        if let path = FileManager.default.urls(for: .cachesDirectory, in: .allDomainsMask).first {
            documentDirectory = path
        }
        
        DispatchQueue.global(qos: .background).async {
            
            if String(describing: url).trimWhiteSpace() != ""{
                
                do{
                    let data = try Data(contentsOf: url)
                    
                    var receivedimage: SVGKImage = SVGKImage()
                    
                    //MARK: - avoiding crash in ios 14 SVGKImage() <---- this will be cause crash
                        
                    if let imgDataParse = SVGKImage(data: data) {
                        receivedimage = imgDataParse
                        
                        guard var img_TEMP = receivedimage.uiImage else{
                            
                            fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                            
                            return
                        }
                        
                        //MARK: - PROCESSING DOWNLOAD IMAGE
 
                        let imageNameFormURL = setImgName(url: "\(String(describing: url))")
                        
                        guard let imageName = documentDirectory?.appendingPathComponent(imageNameFormURL ) else{
                            fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                            return
                        }
                        
                        var size = CGSize(width: WV, height: WV*0.8)
                        
                        if resizeFor == .thumnailJuris{
                            size = CGSize(width: WV*0.45, height: WV*0.3)
                        }
                        else if resizeFor == .icon40X40{
                            size = CGSize(width: 45, height: 45)
                        }
                        
                        guard let data_Image_TEMP = resizeImage(image: img_TEMP, targetSize: size) else {
                            fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                            return
                        }
                        
                        if let data = data_Image_TEMP.heicData(compressionQuality: 0.8) {
                            
                           // if readURLImageFromDatabase(name: String(describing: imageNameFormURL)) == false{
                                
                            print("ROOT FILE FOR SVG: \(String(describing: imageNameFormURL))")
                            
                          //  save_URL_Image_To_Database(name: String(describing: imageNameFormURL))
                            fetchImage(urlIMG: imageName, data: data )
                        }
                        else{
                            fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                        }
                    }
                }
                catch{
                    fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                }
            }
            else{
                fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
            }
        }
    }
}
