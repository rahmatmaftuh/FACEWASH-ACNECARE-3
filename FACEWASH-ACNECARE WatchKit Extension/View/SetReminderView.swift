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
//    @State var voiceOver = false
    @StateObject var notifManager = LocalNotificationManager()
    @State var selected = Date()
    
    @ObservedObject var soundController = SoundController.shared
   
    
    var body: some View {
        
        NavigationView{
            VStack{
                ZStack{
                    NavigationLink("", destination: SetReminderView().environmentObject(notifManager), isActive: $changeTime)
                        .opacity(0)
                    
                    
                    Button(action: {
                        changeTime = true
                    }, label: {
                        
                        Text("Set Reminder")
                            .padding(.trailing, 60)
                        
                    })
                    
                }
                Button(action: {
//                    if voiceOver{
//
//
//
//                    }else {
////
//                        GuidelineSounds.shared.player?.stop()
//                    }
                }, label: {
                    Toggle("Voice Over", isOn: $soundController.voiceOn)
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
                Button(action: {
                    
                }, label: {
                    
                    Toggle(isOn: $isMorningPicker) {

                        DatePicker(
//                    """
//                    \(selected1.formatted(.dateTime.hour().minute()))
//                    Change time
//                    """
                            "Change time"
                    ,
                    selection: $selected1, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true) { Date in

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



                    }
                    .buttonStyle(.borderless)
                    
                    
                   
                    
                })
               
                
                
                HStack{
                    Image(systemName: "moon")
                    Text("Evening")
                    Spacer()
                }
                Button(action: {

                }, label: {
                    Toggle(isOn: $isEveningPicker){
                        DatePicker("Change time", selection: $selected2, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true){ Date in
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
                    .buttonStyle(.borderless)
                })
                HStack{
                    Image(systemName: "location")
                    Text("Location")
                    Spacer()
                    
                }
                Button(action: {
                    
                }, label: {
                    Toggle(isOn: $isMorningPicker){
                        VStack(alignment: .leading){
                            Text("Home")
                                .foregroundColor(Color("startColor"))
                                
                            Text("When return")
                                .foregroundColor(Color("startColor"))
                                .font(.system(size: 15))
                                .opacity(0.5)
                        }
                    }
                })
                
                
                
            }.environmentObject(notifManager)
                .accentColor(Color("startColor"))
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
