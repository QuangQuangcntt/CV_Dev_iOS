//
//  String.swift
//
//
//  Created by BIN CG on 5/8/21.
//

import Foundation

extension String {

    
    func trimWhiteSpace() -> String {
        let string = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return string
    }
}
