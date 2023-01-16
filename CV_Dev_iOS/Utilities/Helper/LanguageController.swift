//
//  LanguageController.swift
//  CoreProgram
//
//  Created by BIN CG on 2/23/21.
//

import Foundation
import UIKit

let codeLanguage = UserDefaults.standard.string(forKey: "app_language") ?? "en"

var settings = UserSettings()


class UserSettings: ObservableObject {

    @Published var lang: String = UserDefaults.standard.string(forKey: "app_language") ?? "en"

    var bundle: Bundle? {
        let b = Bundle.main.path(forResource: lang, ofType: "lproj")!
        return Bundle(path: b)
    }
    
    deinit {}
}
    
////set language
//extension String {
//func localized(_ lang:String) ->String {
//
//        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//
//    }
//
//}






