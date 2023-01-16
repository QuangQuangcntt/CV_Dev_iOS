//
//  LanguageView.swift
//  OneIBC
//
//  Created by Quang Tran on 21/10/2021.
//

import SwiftUI

struct LanguageView: View {
    
    @ObservedObject var TABBAR: tabbarState
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var currentLanguage: String = "english"
    
    
    struct testData: Hashable {
        var ID = UUID().uuidString
        var id: Int = 0
        var code: String = ""
        var name: String = ""
    }
    
    //this is test
    @State var arrLanguages: [testData] = [testData(code: "en", name: "English"),
                                           testData(code: "vi", name: "Vietnam")]
    
    @State var choose: testData = testData(code: UserDefaults.standard.string(forKey: "app_language") ?? "en")
    
    var body: some View {
        
        ZStack{

            Color(hex: 0x000000, alpha: 0.25)
                .ignoresSafeArea(.all)
                .onTapGesture(perform: {
                    self.presentationMode.wrappedValue.dismiss()
                })
            
            VStack(alignment: .center, spacing: 0){
                ZStack{
                    Text("Languages")
                        .foregroundColor(Color(hex: 0x343434))
                        .font(.custom(Font().Medium(), size: Font().Size18()))
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        Button(action:{
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("cancelBTN")
                        }
                        
                        
                        Spacer()
                    }
                }

                VStack(alignment: .center, spacing: 16){
                    
                    ForEach(arrLanguages, id: \.ID) { item in

                        Button(action: {
                            choose = item
                        }) {
                            VStack(alignment: .center, spacing: 8){
                                HStack(alignment: .center, spacing: 0){
                                    if item.name.lowercased() == "english"{
                                        Text("English")
                                            .foregroundColor(Color(hex: 0x343434))
                                            .font(.custom(Font().Medium(), size: Font().Size16())) +
                                        Text(" (default)")
                                            .foregroundColor(Color(hex: 0x343434))
                                            .font(.custom(Font().Italic(), size: Font().Size16()))
                                    }
                                    else{
                                        Text(item.name)
                                            .foregroundColor(Color(hex: 0x343434))
                                            .font(.custom(Font().Regular(), size: Font().Size16()))
                                    }
                                    
                                    Spacer()
                                    
                                    if choose.code == item.code {
                                        Image("Radio_Checked")
                                    }
                                }
                                
                                Rectangle()
                                    .foregroundColor(Color(hex: 0xe1e1e1))
                                    .frame(height: 1, alignment: .center)
                            }
                        }
                    }.padding(.top, 32)
                }
                

                Button(action:{
                    print("Change")
                    
                    print(choose)
                    
                    UserDefaults.standard.set(choose.code, forKey: "app_language")
                    
                    withAnimation(.linear){
                        settings.lang = choose.code
                        UserSettings().lang = choose.code
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        
                        TABBAR.click = .Contact
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }) {
                    ZStack{
                        Rectangle()
                            .fill(LinearGradient(
                                  gradient: .init(colors: [Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))]),
                                  startPoint: .init(x: 0, y: 0),
                                  endPoint: .init(x: 1, y: 0)
                                ))
                            .cornerRadius(8)
                            .frame(width: WV-64, height: 46, alignment: .center)
                        
                        Text("Change")
                            .foregroundColor(Color(hex: 0xffffff))
                            .font(.custom(Font().Regular(), size: Font().Size18()))
                    }.padding(.top, 16)
                }
                
                Text("The app will automatically reload according to the selected language")
                    .foregroundColor(Color(hex: 0x343434))
                    .font(.custom(Font().Regular(), size: Font().Size14()))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: WV-64, alignment: .center)
                    .padding(.top, 8)
            }
            .padding(.all, 16)
            .background(Color.white)
            .cornerRadius(8)
            .padding(.all, 16)
        }
        
    }
}
