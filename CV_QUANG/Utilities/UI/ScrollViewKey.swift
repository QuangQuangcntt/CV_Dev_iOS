//
//  ScrollView.swift
//
//  Created by Quang Tran on 28/09/2021.
//

import Foundation
import SwiftUI
import Combine

class ScrollViewHelper: ObservableObject {
    
    @Published var currentOffset: CGFloat = 0
    @Published var offsetAtScrollEnd: CGFloat = 0
    
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = AnyCancellable($currentOffset
                                        .debounce(for: 0.2, scheduler: DispatchQueue.main)
                                        .dropFirst()
                                        .assign(to: \.offsetAtScrollEnd, on: self))
    }
    deinit {currentOffset = 0 }
    
}

struct preferenceKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    
    typealias Value = CGFloat
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ViewOffsetKey: PreferenceKey {

    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

//detect when view finish render

struct RenderedPreferenceKey: PreferenceKey {
    static var defaultValue: Int = 0
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value = value + nextValue() // sum all those remain to-be-rendered
    }
}

struct ChildSizeReader<Content: View>: View {
    @Binding var size: CGSize
    let content: () -> Content
    var body: some View {
        ZStack {
            content()
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: SizePreferenceKey.self, value: proxy.size)
                    }
                )
        }
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.size = preferences
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero

    static func reduce(value _: inout Value, nextValue: () -> Value) {
        _ = nextValue()
    }
}
