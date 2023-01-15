//
//  LostInternet.swift
//
//
//  Created by Quang Tran on 23/10/2021.
//

import SwiftUI

struct LostInternetConnection: View {
    
    @Binding var isLostInternet: Bool
    
    @ObservedObject var internetMonitor: Monitor_Internet
    
    //MARK: - variables
    @State var isAnimating: Bool = false
    @State var isConnected: Bool = false
    
    @State var circleOffset: CGFloat = 20
    @State var smallArcOffset: CGFloat = 16
    @State var mediumArcOffset: CGFloat = 14.5
    @State var largeArcOffset: CGFloat = 14
    
    @State var arcColor: Color = Color.white
    @State var shadowColor: Color = Color.blue
    @State var wifiHeaderLabel: String = "Wi-Fi"
    
    @State var animationMovingUpwards: Bool = true
    @State var moveArc: Bool = true
    
    @State var animationDuration: Double = 0.35
    
    let group = DispatchGroup()
    
    var body: some View {

   
        ZStack {
            Color.wifiBackground
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 16){
                
                ZStack {
                    
                    //animate dot when connected
                    CircleEmitter(isAnimating: $isConnected)
                    
                    Circle()
                        .fill(self.arcColor)
                        .scaleEffect(0.075)
                        .shadow(color: Color.blue, radius: 5)
                        .offset(y: self.circleOffset)
                        .animation(Animation.easeOut(duration: animationDuration))
                    
                    ZStack {
                        
                        ArcView(radius: 12, fillColor: $arcColor, shadowColor: $shadowColor)
                            .rotationEffect(getRotation(arcBoolean: self.moveArc))
                            .offset(y: smallArcOffset)
                            .animation(Animation.easeOut(duration: self.animationDuration))
                       
                        
                        ArcView(radius: 24, fillColor: $arcColor, shadowColor: $shadowColor)
                            .rotationEffect(getRotation(arcBoolean: self.moveArc))
                            .offset(y: self.mediumArcOffset)
                            .animation(Animation.easeOut(duration: self.animationDuration).delay(self.animationDuration))
                        
                        
                        ArcView(radius: 36, fillColor: $arcColor, shadowColor: $shadowColor)
                            .rotationEffect(getRotation(arcBoolean: self.moveArc))
                            .offset(y: self.largeArcOffset)
                            .animation(Animation.easeOut(duration: self.animationDuration).delay(self.animationDuration * 1.9))
                        
//                        Circle().stroke(style: StrokeStyle(lineWidth: 2.5))
//                            .foregroundColor(Color.blue.opacity(0.5))
//                            .opacity(0.8)
                        
                        Circle().fill(Color.blue.opacity(0.1))
                        
                        Circle().fill(Color.blue.opacity(0.025))
                            .scaleEffect(self.isAnimating ? 5 : 0)
                            .animation(self.isAnimating ? Animation.easeIn(duration: animationDuration * 4.5).repeatForever(autoreverses: false) :Animation.linear(duration: 0)
                            )
                    }
                }.frame(height: 120)
                
                Text(self.wifiHeaderLabel)
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .opacity(self.isAnimating ? 0 : 1)
                    .foregroundColor(Color(hex: 0x505050))
                    .animation(self.isAnimating ? Animation.spring().speed(0.3).repeatForever(autoreverses: false) : Animation.linear(duration: 0).repeatCount(0))


                Text("OR")
                    .foregroundColor(Color(hex: 0x505050))
                    .font(.custom(Font().Medium(), size: Font().Size15()))
                    .padding(.vertical, 32)

                Button(action:{
                    if self.internetMonitor.status == .disconnected{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isLostInternet = false
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
                            .frame(width: WV*0.7, height: (WV*0.7)*0.2, alignment: .center)
                        
                        Text("Continue using App")
                            .foregroundColor(Color(hex: 0xffffff))
                            .font(.custom(Font().Regular(), size: Font().Size18()))
                    }
                }
            }
        }
        .frame(width: WV, height: HV, alignment: .center)
        .onReceive(self.internetMonitor.$status, perform: { status in
            
            //Avoiding wrong flow - example, if self.apiResult.apiResult is normal this function is active (if not having 'if func')
            
            if status == .connected{

                group.enter()

                DispatchQueue.main.async {
                    self.restoreAnimation()
                    self.arcColor = Color.wifiConnected
                    self.shadowColor = Color.white.opacity(0.5)
                    self.wifiHeaderLabel = "Connected"
                    
                    self.isConnected = true
                    
          
                    group.leave()
                }
                
                group.notify(queue: .main) {

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        isLostInternet = false
                    }
                }
            }
            
        })
        .onAppear(perform: {
            // Lock Queue - must inside struct
           
            DispatchQueue.main.async {
                group.enter()

                DispatchQueue.main.async {
                    
                    resetValues()
                    
                    group.leave()
                }
                
                group.notify(queue: .main) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        animate()
                    }
                }
            }
        })
        .onDisappear(perform: {
            
            //avoid cache data before
            restoreAnimation()
            resetValues()
        })
    }
}
