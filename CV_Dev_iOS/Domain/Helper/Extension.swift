//
//  Extension.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
