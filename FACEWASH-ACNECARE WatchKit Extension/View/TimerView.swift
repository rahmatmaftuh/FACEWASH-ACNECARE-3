//
//  TimerView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//
//TUTORIAL : https://www.youtube.com/watch?v=kIaO4UtzBHI

//

import SwiftUI
import UserNotifications

struct TimerView: View {
    @State private var timerCountDown = 40
    @State private var timerRunning = true
    @State private var toEndView = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let path1 = Bundle.main.path(forResource: "step1Nose", ofType:"mp3") ?? ""
    let path2 = Bundle.main.path(forResource: "step2Forehead", ofType: "mp3") ?? ""
    let path3 = Bundle.main.path(forResource: "step3Cheek", ofType: "mp3") ?? ""
    let path4 = Bundle.main.path(forResource: "step4ChinCheek", ofType: "mp3") ?? ""
    let path5 = Bundle.main.path(forResource: "finish", ofType: "mp3") ?? ""
    
    @ObservedObject var voiceController = SoundController.shared
    
    
    func play(_ type: WKHapticType){
        WKInterfaceDevice.current().play(type)
        
    }
    
    
    var body: some View {
        ZStack{
            NavigationLink("",destination: FinishView(), isActive: $toEndView)
                .opacity(0)
            
            
            
            VStack{
                
                
                if timerCountDown > 30 && timerRunning {
                    Text("Clean nose area for 10 seconds")
                        .foregroundColor(Color("titleGuidelineColor"))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .onReceive(timer) { _ in
                            //49
                            if timerCountDown == 39 {
                                play(WKHapticType.notification)
                                
                                if voiceController.voiceOn {
                                    let url1 = URL(fileURLWithPath: path1)
                                    GuidelineSounds.shared.playMusic(sound: url1)
                                }
                                
                                
                                //Resource: https://makeapppie.com/2016/08/29/make-a-watch-os-haptic-catalog-with-a-picker/
                            }
                            
                        }
                    
                    Spacer()
                } else if timerCountDown > 20 && timerRunning {
                    Text("Clean forehead area for 10 seconds")
                        .foregroundColor(Color("titleGuidelineColor"))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .onReceive(timer) { _ in
                            //39
                            if timerCountDown == 29 {
                                play(WKHapticType.notification)
                                
                                
                                if voiceController.voiceOn {
                                    let url2 = URL(fileURLWithPath: path2)
                                    GuidelineSounds.shared.playMusic(sound: url2)
                                }
                            }
                            
                        }
                    
                    
                    Spacer()
                    
                }else if timerCountDown > 10 && timerRunning {
                    Text("Clean cheeks area for 10 seconds")
                        .foregroundColor(Color("titleGuidelineColor"))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .onReceive(timer) { _ in
                            if timerCountDown == 19{
                                
                                play(WKHapticType.notification)
                                
                                if voiceController.voiceOn {
                                    let url3 = URL(fileURLWithPath: path3)
                                    GuidelineSounds.shared.playMusic(sound: url3)
                                }
                                
                            }
                         
                            
                        }
                    Spacer()
                }
                else{
                    Text("Clean chin area for 10 seconds")
                        .foregroundColor(Color("titleGuidelineColor"))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .onReceive(timer) { _ in
                            
                            if timerCountDown == 9 {
                                play(WKHapticType.notification)
                                
                                if voiceController.voiceOn {
                                    let url4 = URL(fileURLWithPath: path4)
                                    GuidelineSounds.shared.playMusic(sound: url4)
                                }
                                
                            }
                            else if timerCountDown == 1 {
                                
                                let url5 = URL(fileURLWithPath: path5)
                                GuidelineSounds.shared.playMusic(sound: url5)
                                
                            }
                            
                        }
                    
                }
                
                Text("\(timerCountDown)")
                    .onReceive(timer) { _ in
                        if timerCountDown > 0 && timerRunning{
                            timerCountDown -= 1
                        }
                        else{
                            timerRunning = false
                            toEndView = true
                        }
                    }
                    .font(.system(size: 70, weight: .heavy))
                    .foregroundColor(Color("startColor"))
                
                
                
            }
            .frame(width: 160, height: 130)
            .position(x: 95, y: 80)
        }.navigationBarBackButtonHidden(true)
        
        
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}


