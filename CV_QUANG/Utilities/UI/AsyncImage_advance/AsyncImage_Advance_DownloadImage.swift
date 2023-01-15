//
//  AsyncImage_Advance_DownloadImage.swift
//
//
//  Created by Quang Tran on 29/12/2022.
//

import Foundation

extension AsyncImage_Advance {
    
    func downloadImage(url: URL){

        var documentDirectory: URL?
       
        //avoid running duplicate
        
        // .cachesDirectory will save to "Library/Caches/" folder
        if let path = FileManager.default.urls(for: .cachesDirectory, in: .allDomainsMask).first {
            documentDirectory = path
        }
        
        DispatchQueue.global(qos: .background).async {

                // 2
            URLSession.shared.downloadTask(with: url) { (tempFileUrl, response, error) in
 
                // 3
                if let imageTempFileUrl = tempFileUrl {

                    //set file name
                    let imageNameFormURL = setImgName(url: "\(String(describing: url))")
                    
                    guard let imageName = documentDirectory?.appendingPathComponent(imageNameFormURL ) else{
                        fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                        return
                    }

                    //using data after cache -> reduce memory cache
                    //MARK: - NOTE: UIImage(named:) -> DATA IMAGE SAVE TO RAM ; UIImage(contentsOfFile:) -> DATA IMAGE NOT SAVE TO RAM

                    var size = CGSize(width: WV, height: WV*0.8)
                    
                    if resizeFor == .thumnailJuris{
                        size = CGSize(width: WV*0.45, height: WV*0.3)
                    }
                    else if resizeFor == .icon40X40{
                        size = CGSize(width: 45, height: 45)
                    }
                    else if resizeFor == .superBig{
                        size = CGSize(width: WV*3, height: WV*2.8)
                    }
                        
                    guard let data_Image_TEMP = downsample(imageAt: imageTempFileUrl, to: size) else {
                        fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                        
                        return
                    }
                    
                    if let data = (data_Image_TEMP).heicData(compressionQuality: 0.8) {

                        print("ROOT FILE: \(String(describing: imageNameFormURL))")
                        
                        //save_URL_Image_To_Database(name: String(describing: imageNameFormURL))
                        
                        //must be Queue.main.async for running after clock queue of stop loading indicator
                        fetchImage(urlIMG: imageName, data: data )
                    }
                    else{
                        print("Error, can not download image")
                        
                        fetchImage(urlIMG: URL(fileURLWithPath: ""), data: Data())
                    }
                }
            }.resume()
        }
    }
}
