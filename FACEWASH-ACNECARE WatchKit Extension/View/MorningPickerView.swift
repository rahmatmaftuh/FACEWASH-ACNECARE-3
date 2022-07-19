//
//  SettingView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//
//

import SwiftUI
import WatchDatePicker

struct MorningPickerView: View {
    
    @EnvironmentObject var notifManager : LocalNotificationManager
    @State var selected = Date()
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        NavigationView {
            
            VStack{
                DatePicker("Change Time", selection: $selected, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true, onCompletion: nil )
                
                Button("Set"){
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
            }
        }
        .environmentObject(notifManager)
        .navigationTitle("Reminder")
        .accentColor(.orange)
        .task{
            try? await notifManager.requestAuthorization()
        }
        .onChange(of: scenePhase){newValue in
            if newValue == .active{
                Task {
                    await notifManager.getCurrentSettings()
                    // await lnManager.getPendingRequests()
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        MorningPickerView()
    }
}

