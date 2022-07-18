//
//  TimerView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//
//TUTORIAL : https://www.youtube.com/watch?v=kIaO4UtzBHI

import SwiftUI
import UserNotifications


struct TimerView: View {
    @State private var TimerViewCountdown = 50
    @State private var timerRunning = true
    @State private var titleTest = "Wash your car"
    @State private var toEndView = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let textTitle = ["Wash your forehead",
                    "Wash your cheek",
                    "Wash your Tzone",
                    "Wash your mind"]
    var hapticTypes = [
        "Notification": WKHapticType.notification,
        "DirectionUp": WKHapticType.directionUp,
        "DirectionDown": WKHapticType.directionDown,
        "Success": WKHapticType.success,
        "Failure": WKHapticType.failure,
        "Retry": WKHapticType.retry,
        "Start": WKHapticType.start,
        "Stop": WKHapticType.stop,
        "Click": WKHapticType.click,
    ]
   // let hapticType = hapticTypes["Notification"]
    
    var body: some View {
        ZStack{
            NavigationLink("",destination: StartCountdownView(), isActive: $toEndView)
                .opacity(0)
      
            
           // WKInterfaceDevice.current().play(hapticType!)
            
//        if TimerViewCountdown == 45 && timerRunning{
////            TimerViewCountdown -= 2
////          titleTest = "Wash your face"
//
//
//        }else if TimerViewCountdown == 30 && timerRunning{
////            TimerViewCountdown -= 3
////            titleTest = "Wash your mind"
//
//        }
        
    
        VStack{
            
            //Text("\(textTitle)")
            
            if TimerViewCountdown > 40 && timerRunning {
                //AVService.shared.playMusic()
                Text("Wash your forehead")
//                    .onReceive(<#T##publisher: Publisher##Publisher#>, perform: <#T##(Publisher.Output) -> Void#>)
                
            } else if TimerViewCountdown > 30 && timerRunning {
                Text("Wash your mind")
            }else if TimerViewCountdown > 10 && timerRunning {
                Text("Wash your car")
            }
            else{
                Text("Wash your heart")
                
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
                .font(.system(size: 80, weight: .heavy))
                .foregroundColor(Color("startColor"))
            
        
        }
        }.navigationBarBackButtonHidden(true)
        

    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

//enum WKHapticType : Int{
//    case Notification
////    case DirectionUp
////    case DirectionDown
////        case Success
////        case Failure
////        case Retry
////        case Start
////        case Stop
////        case Click
//}
