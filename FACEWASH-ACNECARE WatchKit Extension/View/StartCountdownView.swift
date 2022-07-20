//
//  StartTimerView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Rahmat Maftuh Ihsan on 16/07/22.
//

import SwiftUI
import AVFoundation


struct StartCountdownView: View {
    
    @State private var isPressed : Bool = false

    var body: some View {
        NavigationView{
        if isPressed{
            
            CountdownView()
            
           
        }else{
            VStack{
                ZStack{
                    Circle()
                        .frame(width: 130, height: 130)
                        .foregroundColor(Color("startColor"))
                    
                    Text("START")
                        .foregroundColor(Color.black)
                        .font(.system(size: 34))
                        .bold()
                        .italic()
                     
                    
                       
                
                }
                .onTapGesture {
                    isPressed = true
                }
                //Text("Start wash your face")
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
    }
    
}

struct StartCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        StartCountdownView()
    }
}

