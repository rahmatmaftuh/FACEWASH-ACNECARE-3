//
//  SetReminderView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 17/07/22.
//

import SwiftUI
import WatchDatePicker


struct MainSettingView : View {
    @State var changeTime = false
    @State var voiceOver = false
    @StateObject var notifManager = LocalNotificationManager()
    @State var selected = Date()
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        
        VStack{
            ZStack{
                NavigationLink("", destination: SetReminderView()
                    .environmentObject(notifManager)
                               , isActive: $changeTime)
                    .opacity(0)
            Button(action: {
                changeTime.toggle()
                
            }, label: {
                HStack{
                    Text("Set reminder")
                    Spacer()
                    
                }
            })
                
            }
            
            Button(action: {
                if voiceOver{
                }else {
                    AVService.shared.player?.stop()
                }
                
            }, label: {
                HStack{
                    Toggle("Voice over", isOn: $voiceOver)
                }
            })
            Spacer()

            
        }.navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
    }
}


struct SetReminderView: View {
    @State private var isMorningPicker = false
    @State private var isEveningPicker = false
    @State private var isLocation = false
    @EnvironmentObject var notifManager : LocalNotificationManager
    @State var selected = Date()
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some View {
        ScrollView {
            HStack{
                Image(systemName: "sun.max")
                Text("Morning")
                Spacer()
                
            }
            Toggle(isOn: $isMorningPicker){
                DatePicker("\(selected)", selection: $selected, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true, onCompletion: nil )
                
                if isMorningPicker {
                   
                }
            }
            
            HStack{
                Image(systemName: "moon")
                Text("Morning")
                Spacer()
            }
            Toggle(isOn: $isEveningPicker){
                VStack(alignment: .leading){
                    Text("08.00")
                        .fontWeight(.semibold)
                    Text("Change time")
                        .font(.system(size: 15))
                        .opacity(0.5)
                }
            }
            HStack{
                Image(systemName: "location")
                Text("Morning")
                Spacer()
                
            }
            Toggle(isOn: $isMorningPicker){
                VStack(alignment: .leading){
                    Text("Home")
                        .fontWeight(.semibold)
                    Text("When return")
                        .font(.system(size: 15))
                        .opacity(0.5)
                }
            }
            Button("Save") {
                Task{
                    let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: selected )
                    let localNotificationMorning = LocalNotificationVar(identifier: UUID().uuidString,
                                                                          title: "Wash your face",
                                                                          body: "It's morning already",
                                                                          dateComponents: dateComponents,
                                                                          repeats: true)
                    await notifManager.schedule(localNotification: localNotificationMorning)
                    
                }
            }
            
        }  .environmentObject(notifManager)
            .navigationTitle("Reminder")
            .accentColor(.orange)
            .task{
                try? await notifManager.requestAuthorization()
            }
            .onChange(of: scenePhase){newValue in
                if newValue == .active{
                    Task {
                        await notifManager.getCurrentSettings()
                         await notifManager.getPendingRequests()
                    }
                }
            }
        
    }
}

struct SetReminderView_Previews: PreviewProvider {
    static var previews: some View {
        SetReminderView()
    }
}


