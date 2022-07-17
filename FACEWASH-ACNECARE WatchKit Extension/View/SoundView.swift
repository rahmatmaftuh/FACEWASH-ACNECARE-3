//
//  SoundView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//


import SwiftUI

struct SoundView: View {
    @State private var isStarted = false
    @State var isPlayingGuide = false
    
    var body: some View {
        NavigationView {
            
            VStack{
                ZStack {
                    NavigationLink("", destination: TimerView(), isActive: $isStarted)
                        .clipShape(Circle())
                    
                    Button(action: {
                        isStarted.toggle()
                        isPlayingGuide.toggle()
                        if isPlayingGuide {
                            AVService.shared.playMusic()
                        }
                    }, label: {
                        Text("START")
                            .foregroundColor(Color.black)
                            .font(.system(size: 19))
                            .bold()
                            .italic()
                            .frame(width: 130, height: 130)
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                    .background(Color("startColor"))
                    .clipShape(Circle())
                }
            }
            .navigationTitle("Acnecare")
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(Color("navColor"))
            
            
            
        }
    }
}

struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        SoundView()
    }
}


