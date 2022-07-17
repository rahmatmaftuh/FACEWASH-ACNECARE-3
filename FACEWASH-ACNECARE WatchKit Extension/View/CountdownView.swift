//
//  CountdownView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Rahmat Maftuh Ihsan on 16/07/22.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 3
let lineWidth: CGFloat = 20
let radius: CGFloat = 50

struct CountdownView: View {
    
    @State private var isActive = true
    @State private var TimeRemaining: CGFloat = defaultTimeRemaining
    @State private var startTimerView = false
   
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        
            ZStack{
                NavigationLink("",destination: TimerView(), isActive: $startTimerView )
                    .opacity(0)
                Circle()
                    .stroke(Color.green.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                Circle()
                    .trim(from:0, to:1 - ((defaultTimeRemaining-TimeRemaining)/defaultTimeRemaining))
                    .stroke( Color.blue,
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                Text("\(Int(TimeRemaining))")               .foregroundColor(Color.green)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .onReceive(timer, perform: { _ in
                        guard isActive else{return}
                        if TimeRemaining > 0{
                            TimeRemaining -= 1
                        }
//                        else if TimeRemaining == 0{
//                        }
                        else{
                            isActive = false
                            startTimerView.toggle()
//                            TimeRemaining = defaultTimeRemaining
                        }
                    })
                    
            }//.frame(width: radius * 2, height: radius * 2)

        
       
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}


