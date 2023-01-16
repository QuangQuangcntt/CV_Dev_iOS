//
//  AsyncImage_PTC_Lowest.swift
//  design_pattern
//
//  Created by Quang Tran on 15/09/2022.
//

import Foundation
import SwiftUI

enum resizeImageFor {
    case universal
    case icon40X40
    case thumnailJuris
    case superBig   // only using for image in services detail
}

//MARK:  - setImgName

protocol setImgName_ptc {
    func setImgName(url: String) -> String
}

extension setImgName_ptc {
    
    func setImgName(url: String) -> String {

       // let extensionIMG: String = url.components(separatedBy: ".").last ?? ".heic"

        var name: String = url
        
        name = name.replacingOccurrences(of: ":", with: "")
        name = name.replacingOccurrences(of: ".", with: "")
        name = name.replacingOccurrences(of: "/", with: "")
        name = name.replacingOccurrences(of: "-", with: "")
        
        //print("EXTENSION IMAGE: \(extensionIMG)")
        
        //return "\(name).\(extensionIMG)"
        return "\(name).heic"
    }
}

//MARK:  - downsampleImage

protocol downsampleImage_ptc {
    
    func downsample(imageAt: URL,
                    to: CGSize,
                    scale: CGFloat) -> UIImage?
}

extension downsampleImage_ptc {
    
    func downsample(imageAt imageURL: URL,
                    to pointSize: CGSize,
                    scale: CGFloat = UIScreen.main.scale) -> UIImage? {

        // Create an CGImageSource that represent an image
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions) else {
            return nil
        }
        
        // Calculate the desired dimension
        let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
        
        // Perform downsampling
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
        ] as CFDictionary
        guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions) else {
            return nil
        }
        
        // Return the downsampled image as UIImage
        return UIImage(cgImage: downsampledImage)
    }
}


//MARK:  - loadImageThumnail: LOAD IMAGE THUMNAIL FROM FILE TO UI

protocol loadImageThumnail_PTC {
    
    func loadImageThumnail(imageAt imageURL: URL) -> UIImage?
}

extension loadImageThumnail_PTC {
    
    func loadImageThumnail(imageAt imageURL: URL) -> UIImage? {

        // Create an CGImageSource that represent an image
        let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions) else {
            return nil
        }
        
        // Calculate the desired dimension

        // Perform downsampling
        let Options = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true
        ] as CFDictionary
        
        guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, Options) else {
            return nil
        }
        
        // Return the downsampled image as UIImage
        return UIImage(cgImage: downsampledImage)
    }
}


//MARK:  - resizeImage:

protocol resizeImage_PTC {
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage?
}

extension resizeImage_PTC {
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
