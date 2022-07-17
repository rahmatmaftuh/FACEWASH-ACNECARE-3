//
//  StartTimerView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Rahmat Maftuh Ihsan on 16/07/22.
//

import SwiftUI


struct StartCountdownView: View {
    
    @State private var isPressed : Bool = false

    var body: some View {
        if isPressed{
            CountdownView()
        }else{
            VStack{
                ZStack{
                    Circle()
                    
                    Text("START")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .italic()
                       
                
                }
                .onTapGesture {
                    isPressed = true
                }
                Text("Start wash your face")
            }
        }
    }
}

struct StartCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        StartCountdownView()
    }
}

