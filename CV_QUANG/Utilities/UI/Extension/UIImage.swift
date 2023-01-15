//
//  UIImage.swift
//  CoreProgram
//
//  Created by BIN CG on 2/22/21.
//

import Foundation
import UIKit

extension UIImage{

    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    func heicData(compressionQuality: Float) -> Data? {
        let destinationData = NSMutableData()

        guard
            let cgImage = self.cgImage,
            let destination = CGImageDestinationCreateWithData(destinationData, "public.heic" as CFString, 1, nil)
            else { return nil }

        let options = [kCGImageDestinationLossyCompressionQuality: compressionQuality]
        CGImageDestinationAddImage(destination, cgImage, options as CFDictionary)
        CGImageDestinationFinalize(destination)

        return destinationData as Data
    }
}
