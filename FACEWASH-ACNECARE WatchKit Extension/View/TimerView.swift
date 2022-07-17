//
//  TimerView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//
//TUTORIAL : https://www.youtube.com/watch?v=kIaO4UtzBHI

import SwiftUI



struct TimerView: View {
    @State private var TimerViewCountdown = 60
    @State private var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text("Forehead")
            
            Text("\(TimerViewCountdown)")
                .onReceive(timer) { _ in
                    if TimerViewCountdown > 0 && timerRunning{
                        TimerViewCountdown -= 1
                    }else{
                        timerRunning = false
                    }
                }
                .font(.system(size: 80, weight: .heavy))
            
        }

    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

