//
//  Project_View.swift
//  CV_Dev_iOS
//
//  Created by Quang Tran on 20/03/2022.
//

import SwiftUI

struct Project_View: View {
    
    //go to rootView
    @EnvironmentObject var appState: AppState
    
    //tabbar state
    @ObservedObject var selectType: tabbarState
    
    struct dataExperience: Hashable {
        var time: String = ""
        var company: String = ""
        var position: String = ""
        var Project: String = ""
        var description: String = ""
    }
    
    @State var arrExperience: [dataExperience] = []
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {

            VStack(alignment: .leading, spacing: 0){
                
                Rectangle()
                    .foregroundColor(Color(hex: 0x707070))
                    .frame(width: 2, height: 32, alignment: .center)
                    .padding(.leading, 5)
                
                ForEach(arrExperience, id: \.self){ index in
                    
                    HStack(alignment: .center, spacing: 16){
                        
                        Circle()
                            .foregroundColor(Color(hex: 0x9A293E))
                            .frame(width: 12, height: 12, alignment: .center)
                        
                        Text(index.time)
                            .foregroundColor(Color(hex: 0x6F4B51))
                            .font(.custom(Font().MediumItalic(), size: Font().Size16()))
                        
                        Spacer()
                        
                    }.padding(.vertical, 4)
                    
                    
                    HStack(alignment: .center, spacing: 16){
                        
                        Rectangle()
                            .foregroundColor(Color(hex: 0x707070))
                            .frame(width: 2, alignment: .center)
                        
                        VStack(alignment: .leading, spacing: 28){
                            
                            Spacer()
                                .frame(height: 4, alignment: .center)
                            
                            VStack(alignment: .leading, spacing: 8){
                                
                                Text("Company")
                                    .foregroundColor(Color(hex: 0xEB7B77))
                                    .font(.custom(Font().Bold(), size: Font().Size13()))
                                
                                Text(index.company)
                                    .foregroundColor(Color(hex: 0x6F4B51))
                                    .font(.custom(Font().Bold(), size: Font().Size14()))
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 8){
                                
                                Text("Position")
                                    .foregroundColor(Color(hex: 0xEB7B77))
                                    .font(.custom(Font().Bold(), size: Font().Size13()))
                                
                                Text(index.position)
                                    .foregroundColor(Color(hex: 0x6F4B51))
                                    .font(.custom(Font().Bold(), size: Font().Size14()))
                            }
                            
                            
                            
                            VStack(alignment: .leading, spacing: 8){
                                
                                Text("Project")
                                    .foregroundColor(Color(hex: 0xEB7B77))
                                    .font(.custom(Font().Bold(), size: Font().Size13()))
                                
                                 Text(index.Project)
                                    .foregroundColor(Color(hex: 0x6F4B51))
                                    .font(.custom(Font().Bold(), size: Font().Size16()))
                            }
                            
                            
                            VStack(alignment: .leading, spacing: 8){
                                
                                Text("Description")
                                    .foregroundColor(Color(hex: 0xEB7B77))
                                    .font(.custom(Font().Bold(), size: Font().Size13()))
                                
                                 Text(index.description)
                                    .foregroundColor(Color(hex: 0x6F4B51))
                                    .font(.custom(Font().Italic(), size: Font().Size14()))
                            }

                            
                            Button{
                                print("View detail project: \(index.Project)")

                            }label: {
                                Text("View detail")
                                    .foregroundColor(Color.white)
                                    .font(.custom(Font().Italic(), size: Font().Size14()))
                                    .padding(.vertical, 8).padding(.horizontal, 12)
                                    .background(
                                        Color(hex: 0xEB7B77)
                                    )
                                    .cornerRadius(20)
                                    .shadow(color: Color(hex: 0xEB7B77, alpha: 0.8), radius: 8, x: 4, y: 4)
                                    .padding(.vertical, 16)
                                    
                            }
                            
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                    }.padding(.leading, 5)
                }
                
                //Last dot
                
                HStack(alignment: .center, spacing: 16){
                    
                    Circle()
                        .foregroundColor(Color(hex: 0x9A293E))
                        .frame(width: 12, height: 12, alignment: .center)
                    
                    Spacer()
                    
                }.padding(.vertical, 4)
                
                //add spacer for avoid tabbar when scroll to bottom
                Spacer()
                    .frame(height: 100, alignment: .center)
                
            }.padding(.all, 16)

        }
        .frame(width: WV, alignment: .center)// not set height: -> Auto height
        
        .background(Color(hex: 0xFCFAF7))
        .onAppear(perform: {
            
            //avoid duplicate
            if arrExperience.isEmpty{
                setupData()
            }
           
        })
       
    }
}
