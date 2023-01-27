//
//  Button_Wave_Animation.swift
//
//  Created by Quang Tran on 04/11/2021.
//

import SwiftUI

//popUp live chat
struct phoneInfor: Hashable{
    var ID = UUID().uuidString
    var name: String = ""
    var icon: String = ""
    var link: String = ""
}

struct Choose_Communicate: View {
    
    @Binding var isChat: Bool
    
    @State var arrLiveChat: [phoneInfor] = [phoneInfor(name: "Zalo",
                                                       icon: "https://i.imgur.com/VOov7m4.png",
                                                       link: "http://zalo.me/84918851529"),
                                            phoneInfor(name: "Messenger",
                                                       icon: "https://i.imgur.com/nNCTPpU.png",
                                                       link: "https://www.facebook.com/quang.quang.098"),
                                            phoneInfor(name: "Linkedin",
                                                       icon: "https://i.imgur.com/27bzt0E.png",
                                                       link: "https://www.linkedin.com/in/quang-tran-cntt")]
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var numberTXT: String = "0918851529"
    @State var titleTXT: String = "Phone: "
    
    var body: some View {
        ZStack{

            Button(action:{
                self.presentationMode.wrappedValue.dismiss() //tap anywhere outside view to close view
            }) {
                Color(hex: 0x000000, alpha: 0.25)
                    .ignoresSafeArea(.all)
            }
            
            VStack(alignment: .center, spacing: 0)
            {
                Button(action:{
                    // make phone call
                    print("Phone: "+"0918851529")
                    guard let url = URL(string: "tel://0918851529") else { return }
                    UIApplication.shared.open(url)
                }) {
                    
                    HStack(alignment: .center, spacing: 0){
                        
                        Text(titleTXT)
                            .font(.custom(Font().Medium(), size: 16))
                            .foregroundColor(Color.black)
                            .padding(.top,16)
                        
                        Text(numberTXT)
                            .font(.custom(Font().Medium(), size: 16))
                            .foregroundColor(Color.blue)
                            .padding(.top,16)
                    }
                    .frame(alignment: .center)
                    
                }
                .padding(.top, 16)
                
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: 1, alignment: .center)
                    .padding(.top,16)
                
                LazyVGrid(columns: columns, spacing: 0) {
                    
                    if arrLiveChat.count > 0 {
                        ForEach(arrLiveChat, id: \.ID) { item in

                            Button(action:{
                                //direct to App
                                openAppAction(info: item)
                            }) {
                                VStack(alignment: .center, spacing: 8){
                                    
                                    AsyncImage_Advance(resizeFor: .icon40X40,
                                                       isLazy: false,
                                                       url: URL(string: item.icon) ?? URL(string: "-")!,
                                                       placeholder: {
                                        IMG_Indicator()
                                    })
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 48, height: 48, alignment: .center)

                                    Text(item.name)
                                        .font(.custom(Font().Light(), size: 14))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }.padding(.vertical, 32)
            }
            .background(Color.white)
            .cornerRadius(8)
            .frame(width: WV-64, alignment: .center)
        }
    }
}
