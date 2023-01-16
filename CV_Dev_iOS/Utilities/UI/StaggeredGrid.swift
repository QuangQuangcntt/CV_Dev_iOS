//
//  StaggeredGrid.swift
//  Staggered_Grid
//
//  Created by Quang Tran on 02/12/2022.
//

import SwiftUI

//Custom View Vuilder....

//T -> is to hold the identifiable collection of data...

struct StaggeredGrid<Content: View, T: Hashable>: View {
    
    //It will return each object from collection to build View...
    var content: (T) -> Content
    
    @Binding var list: [T]

    var columns: Int

    var spacing: CGFloat = 0
    
    var isLazy: Bool = false
    
    init(columns: Int,
         spacing: CGFloat,
         list: Binding<[T]> ,
         isLazy: Bool,
         @ViewBuilder content: @escaping (T) -> Content) {

        self.content = content
        self.spacing = spacing
        self._list = list
        self.isLazy = isLazy
        self.columns = columns
    }
    
    @State var arrSpacing: [Int] = []
    
    // Staggered Grid Function....
    
    func setUpList() -> [[T]] {
        
        var columns_Local = columns
        
        if list.count < columns_Local {
            columns_Local = list.count
        }
        
        var gridArray: [[T]] = Array(repeating: [], count: columns_Local)
        
        var currentIndex: Int = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1) {
                currentIndex = 0
            }
            else{
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    var body: some View {
        if isLazy {
            
            HStack(alignment: .top){
                    
                    let data = setUpList()
                    
                    ForEach(Array(data.enumerated()), id: \.offset) { item, columnsData in

                        LazyVStack(spacing: 16){
                            
                            ForEach(columnsData, id: \.self) { object in
                                
                                content(object)
                            }
                        }
                    }
                }
        }
        else{
            HStack(alignment: .top, spacing: self.list.count < 3 ? self.spacing * 2 : self.spacing){
                    
                    let data = setUpList()
                    
                    ForEach(Array(data.enumerated()), id: \.offset) { item, columnsData in

                        VStack(spacing: 16){
                            
                            ForEach(columnsData, id: \.self) { object in
                                
                                content(object)
                            }
                        }
                    }
                }
        }

        

        
        // if arr[0][0] == 2  --> Spacer() content Spacer()
    }
}
