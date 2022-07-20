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
    //   @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                ZStack{
                NavigationLink("", destination: SetReminderView().environmentObject(notifManager), isActive: $changeTime)
                    .opacity(0)
                
                 HStack{
                        Button(action: {
                            changeTime = true
                        }, label: {
                            Text("Set Reminder")
                            
                        })
                     Spacer()
                    }
                }
                
                Button(action: {
                    if voiceOver{
                        
                        
                        
                    }else {
                        GuidelineStep1.shared.player?.stop()
                        GuidelineStep2.shared.player?.stop()
                        GuidelineStep3.shared.player?.stop()
                        GuidelineStep4.shared.player?.stop()
                    }
                }, label: {
                    Toggle("Voice Over", isOn: $voiceOver)
                })
                Spacer()
                
                
            }
        }.navigationBarBackButtonHidden(false)
        
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
    }
}


struct SetReminderView: View {
    @State private var isMorningPicker = false
    @State private var isEveningPicker = false
    @State private var isLocation = false
    @EnvironmentObject var notifManager : LocalNotificationManager
    @State var selected1 = Date()
    @State var selected2 = Date()
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some View {
        NavigationView{
            ScrollView {
                HStack{
                    Image(systemName: "sun.max")
                    Text("Morning")
                    Spacer()
                    
                }
                Toggle(isOn: $isMorningPicker) {
                    
                    DatePicker("""
                \(selected1.formatted(.dateTime.hour().minute()))
                Change time
                """, selection: $selected1, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true){ Date in
                        
                        if isMorningPicker {
                            Task{
                                let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: selected1 )
                                let localNotificationMorning = LocalNotificationVar(identifier: UUID().uuidString,
                                                                                    title: "Wash your face",
                                                                                    body: "It's morning already",
                                                                                    dateComponents: dateComponents,
                                                                                    repeats: true)
                                
                                await notifManager.schedule(localNotification: localNotificationMorning)
                                
                            }
                        }
                    }
                    
                    //                    if isMorningPicker {
                    //
                    //                    }
                }
                
                
                HStack{
                    Image(systemName: "moon")
                    Text("Evening")
                    Spacer()
                }
                Toggle(isOn: $isEveningPicker){
                    DatePicker("""
\(selected2.formatted(.dateTime.hour().minute()))
Change time
""", selection: $selected2, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true){ Date in
                        if isEveningPicker{
                            Task {
                                let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: selected2 )
                                let localNotificationMorning = LocalNotificationVar(identifier: UUID().uuidString,
                                                                                    title: "Wash your face",
                                                                                    body: "It's morning already",
                                                                                    dateComponents: dateComponents,
                                                                                    repeats: true)
                                await notifManager.schedule(localNotification: localNotificationMorning)
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                HStack{
                    Image(systemName: "location")
                    Text("Location")
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
                
                
                
            }.environmentObject(notifManager)
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
}

struct SetReminderView_Previews: PreviewProvider {
    static var previews: some View {
        SetReminderView()
    }
}


