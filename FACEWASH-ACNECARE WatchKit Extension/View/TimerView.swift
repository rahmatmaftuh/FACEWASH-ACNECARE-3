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
    @State private var TimerViewCountdown = 50
    @State private var timerRunning = true
    
    @State private var toEndView = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
//    var hapticTypes = [
//        "Notification": WKHapticType.notification,
//        "DirectionUp": WKHapticType.directionUp,
//        "DirectionDown": WKHapticType.directionDown,
//        "Success": WKHapticType.success,
//        "Failure": WKHapticType.failure,
//        "Retry": WKHapticType.retry,
//        "Start": WKHapticType.start,
//        "Stop": WKHapticType.stop,
//        "Click": WKHapticType.click,
//    ]
   // let hapticType = hapticTypes["Notification"]
    func play(_ type: WKHapticType){

    }
    
//    func notifyUser(hapticType type: WKHapticType,
//      repeatHandler: ((UnsafeMutablePointer<WKHapticType>) -> Time
//    Interval)? = nil)
    
    
    var body: some View {
        ZStack{
            NavigationLink("",destination: FinishView(), isActive: $toEndView)
                .opacity(0)
      
            
           // WKInterfaceDevice.current().play(hapticType!)
        
    
        VStack{

            
            if TimerViewCountdown > 40 && timerRunning {
                //AVService.shared.playMusic()
                Text("Clean nose area for 10 seconds")
                    .foregroundColor(Color("titleGuidelineColor"))
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .onReceive(timer) { _ in
                       
                        if TimerViewCountdown == 50{
//                            play(.Notification)
                            GuidelineStep1.shared.playMusic()
                            
//HAPTIC DI WATCHOS GAPAKE UIIMPACT DSB, TAPI PAKENYA WKHAPTICTYPE
                            
//Resource: https://makeapppie.com/2016/08/29/make-a-watch-os-haptic-catalog-with-a-picker/
                        }
                       
                    }
                
                Spacer()
                
            } else if TimerViewCountdown > 30 && timerRunning {
                Text("Clean forehead area for 10 seconds")
                    .foregroundColor(Color("titleGuidelineColor"))
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .onReceive(timer) { _ in

                        if TimerViewCountdown == 40{

                            GuidelineStep2.shared.playMusic()
                        }

                    }
               
                   
                Spacer()
                
            }else if TimerViewCountdown > 10 && timerRunning {
                Text("Clean cheeks area for 20 seconds")
                    .foregroundColor(Color("titleGuidelineColor"))
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .onReceive(timer) { _ in

                        if TimerViewCountdown == 30{

//                            GuidelineStep3.shared.playMusic()
                            GuidelineStep3.shared.playMusic()
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

                        if TimerViewCountdown == 10{

                            GuidelineStep4.shared.playMusic()

                        }

                    }
                
            }
            Text("\(TimerViewCountdown)")
                .onReceive(timer) { _ in
                    if TimerViewCountdown > 0 && timerRunning{
                        TimerViewCountdown -= 1
//                        AVService.shared.playMusic()
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



enum WKHapticType : Int{
    case Notification
    case DirectionUp
    case DirectionDown
        case Success
        case Failure
        case Retry
        case Start
        case Stop
        case Click
}
