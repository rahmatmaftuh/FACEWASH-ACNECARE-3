//
//  ContentView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//

import SwiftUI

struct ContentView: View {
    @State var changeTime = false
    @State var selectedTag = 1
    var body: some View {
      
            TabView(selection: $selectedTag){
              
                StartCountdownView()
                    .tag(0)
           
              
                MainSettingView()
                    .tag(1)
                
              
                GuidelineView()
                    .tag(2)
            
            }.tabViewStyle(PageTabViewStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
