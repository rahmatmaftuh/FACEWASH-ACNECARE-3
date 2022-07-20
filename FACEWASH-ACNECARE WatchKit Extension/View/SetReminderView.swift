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
            NavigationLink("Set Reminder", destination: SetReminderView().environmentObject(notifManager))
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
        
        ScrollView {
            HStack{
                Image(systemName: "sun.max")
                Text("Morning")
                Spacer()

            }
            Toggle(isOn: $isMorningPicker) {

                DatePicker("\(selected1.formatted())", selection: $selected1, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true){ Date in
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

                if isMorningPicker {

                }
            }

            HStack{
                Image(systemName: "moon")
                Text("Morning")
                Spacer()
            }
            Toggle(isOn: $isEveningPicker){
                DatePicker("\(selected2.formatted())", selection: $selected2, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true){ Date in
                    Task{
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


        }  .environmentObject(notifManager)
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


