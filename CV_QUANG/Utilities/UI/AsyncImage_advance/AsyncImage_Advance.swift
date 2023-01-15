//
//  AsyncImage_Advance.swift
//
//
//  Created by Quang Tran on 29/12/2022.
//

import SwiftUI

struct AsyncImage_Advance<Placeholder: View>: View,
                                              loadImageThumnail_PTC,
                                              setImgName_ptc,
                                              downsampleImage_ptc,
                                              resizeImage_PTC,
                                              Connectivity_protocol {
    private var placeholder: Placeholder
    
    public var resizeFor: resizeImageFor?
    
    private var url: URL
    
    public let lock = NSLock()
    
    private var isLazy: Bool
    
    init(
        resizeFor: resizeImageFor,
        isLazy: Bool,
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.resizeFor = resizeFor
        self.isLazy = isLazy
        self.placeholder = placeholder()
        self.url = url
    }
    
    enum stateLoading {
        case isLoading
        case finish
        case empty
    }
    
    @State var stateLoad: stateLoading = .isLoading

    @State var IMG_Result = UIImage()
    
    var body: some View {

        switch stateLoad {
            case .isLoading:
                placeholder
                    .onAppear(){
                        loadImage(url: url)
                    }
            case .empty:
                EmptyImage_AsyncImage()
            case .finish:
                LazyVStack(alignment: .center, spacing: 0){
                    Image(uiImage: IMG_Result)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
        }
    }
}

struct EmptyImage_AsyncImage: View {
    
    var body: some View {
        ZStack{
            
            Color(hex: 0xe1e1e1)
                .ignoresSafeArea()
            
            Image("placeHolder_IMG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24.2, height: 24.2)
        }
    }
}
