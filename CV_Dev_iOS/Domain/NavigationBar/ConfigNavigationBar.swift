//
//  SupportFile.swift
//  NavBartitleColor
//
//  Created by BIN CG on 10/4/21.
//

import Foundation
import QuartzCore
import SwiftUI
import UIKit

struct NavigationBarModifier: ViewModifier {
  var textColor: UIColor

  init(textColor: UIColor) {
    
    
    self.textColor = textColor
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = .clear
    coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = textColor
  }

  func body(content: Content) -> some View {
    ZStack{
       content
        VStack {
          GeometryReader { geometry in
            
            Rectangle()
                  .foregroundColor(Color(hex: 0xFCFAF7))
                .frame(height: geometry.safeAreaInsets.top)
                .edgesIgnoringSafeArea(.top)
              Spacer()
          }
        }
     }
  }
}


extension View {
  func navigationBarColor(textColor: UIColor) -> some View {
    self.modifier(NavigationBarModifier(textColor: textColor))
  }
}

extension View {
  var colorNavigation: some View {
    self.navigationBarColor(textColor: UIColor(rgb: Int(CIManager().TextColor_Brown())))   //set navigation bar title color
  }
}

class HostingController<Content> : UIHostingController<Content> where Content : View {
  @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
     return .lightContent
  }
}



//go to root view

struct RootPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { return self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

typealias RootPresentationMode = Bool

extension RootPresentationMode {
    
    public mutating func dismiss() {
        self.toggle()
    }
}
