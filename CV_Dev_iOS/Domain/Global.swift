//
//  Global.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import Foundation
import UIKit

public class AppState : ObservableObject{
    @Published var moveToDashboard: Bool = false
}

public let WV = UIScreen.main.bounds.width
public let HV = UIScreen.main.bounds.height
