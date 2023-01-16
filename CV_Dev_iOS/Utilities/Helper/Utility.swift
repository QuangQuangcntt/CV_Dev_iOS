//
//  Utility.swift

//  Created by BIN CG on 6/29/21.
//

import Foundation
import SwiftUI
import UIKit

public class Utility {
    
    func setupPhoneNumber(phoneSTR: String) -> String{
        
        if phoneSTR.contains("+"){
            return phoneSTR
        }
        let phoneResult = "+\(phoneSTR)"
        return phoneResult
    }
}

//Translucent background for fullScreenCover : https://stackoverflow.com/questions/64301041/swiftui-translucent-background-for-fullscreencover
struct BackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        //append data inside DispatchQueue.main.async avoid error "Thread 1: Fatal error: Can't remove last element from an empty collection"
                DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}


//blur intensity : https://stackoverflow.com/questions/28140781/how-to-edit-the-uiblureffect-intensity/31554386


//hight light text when searching

struct HighlightedText: View {
    let text: String
    let matching: String
    
    let lowerMatching: String
   

    init(_ text: String, matching: String) {
        self.text = text
        self.matching = matching
        
        self.lowerMatching = matching.lowercased()
    }

    var body: some View {

        var tagged: String = ""
        
        //normal
        tagged = self.text
            .replacingOccurrences(of: self.matching,
                                  with: "<SPLIT>>\(self.matching)<SPLIT>")
        
        //all upper
        tagged = tagged
            .replacingOccurrences(of: self.matching.uppercased(),
                                  with: "<SPLIT>>\(self.matching.uppercased())<SPLIT>")
        
        //all lower
        tagged = tagged
            .replacingOccurrences(of: self.lowerMatching,
                                  with: "<SPLIT>>\(self.lowerMatching)<SPLIT>")
        
        
        //bold first character of search text
//        tagged = tagged
//            .replacingOccurrences(of: setFirstBold(str: self.lowerMatching),
//                                  with: "<SPLIT>>\(setFirstBold(str: self.lowerMatching))<SPLIT>")

  
        let split = tagged.components(separatedBy: "<SPLIT>")
        
        return split.reduce(Text("")) { (a, b) -> Text in
            
            guard !b.hasPrefix(">") else {

                //set upper case first character
                let result = a + Text(b.dropFirst()).foregroundColor(Color(hex: 0x107cec))

                return result
            }

            //if can not find any character in string
            return a + Text(b)
        }
        
//        func setFirstBold(str: String) -> String{
//
//            var resultSTR = str
//
//            let index = str.index(str.startIndex, offsetBy: 0)
//
//            resultSTR.replaceSubrange(index...index, with: "\(Array(str.uppercased())[0])")
//
//            print(resultSTR)
//        }
    }
    
   
}

// tutorial: https://stackoverflow.com/questions/59426359/swiftui-is-there-exist-modifier-to-highlight-substring-of-text-view
//-- DONE


//function scale and opacity for scrollView

func getScalledValue(proxy: GeometryProxy) -> CGFloat {
    let x = proxy.frame(in: .global).minX
    let value = abs(x-32)
    if  value < 150 {
        //print(value)
        let scaleValue = 1 + (150 - value) / 700
        //print(scaleValue)
        return scaleValue
    }
    return 1
}


extension  UITextField {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}


//Animation shaking

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

extension Image {
    init?(base64String: String) {
        guard let data = Data(base64Encoded: base64String) else { return nil }
        guard let uiImage = UIImage(data: data) else { return nil }
        self = Image(uiImage: uiImage)
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}

struct UserDefaultsManager {
    static var userDefaults: UserDefaults = .standard
    
    static func set<T>(_ value: T, forKey: String) where T: Encodable {
        if let encoded = try? JSONEncoder().encode(value) {
            userDefaults.set(encoded, forKey: forKey)
        }
    }
    
    static func get<T>(forKey: String) -> T? where T: Decodable {
        guard let data = userDefaults.value(forKey: forKey) as? Data,
            let decodedData = try? JSONDecoder().decode(T.self, from: data)
            else { return nil }
        return decodedData
    }
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
