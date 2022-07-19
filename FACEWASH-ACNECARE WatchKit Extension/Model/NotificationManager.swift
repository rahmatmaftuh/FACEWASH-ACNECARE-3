//
//  NotificationManager.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//


import Foundation
import SwiftUI
import UserNotifications

@MainActor
class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isGranted = false
    @Published var pendingRequests : [UNNotificationRequest] = []
    
    override init(){
        super.init()
        notificationCenter.delegate = self
    }
    
    //Delegate Function
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        await getPendingRequests()
        return[.sound, .banner]
    }
    
    func requestAuthorization () async throws{
        try await notificationCenter
            .requestAuthorization(options: [.sound, .badge, .alert])
        await getCurrentSettings()
        
    }
    
    func getCurrentSettings() async{
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
        print(isGranted)
    }
    
//    func openSettings() {
//        if let url = URL(string: UIApplication.openSettingsURLString){
//            if UIApplication.shared.canOpenURL(url){
//                Task{
//                    await  UIApplication.shared.open(url)
//                }
//            }
//        }
//    }
    
    func schedule(localNotification: LocalNotificationVar) async {
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.body = localNotification.body
        content.sound = .default
        
            guard let dateComponents = localNotification.dateComponents else { return }
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: localNotification.repeats)
            let request = UNNotificationRequest(identifier: localNotification
                .identifier, content: content, trigger: trigger)
            try? await notificationCenter.add(request)
        
        await getPendingRequests()
        
    }
    
    func getPendingRequests() async{
        pendingRequests = await notificationCenter.pendingNotificationRequests()
        print("Pending: \(pendingRequests.count)")
    }
    
    func removeRequest(withIdentifier identifier: String){
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        if let index = pendingRequests.firstIndex(where: {$0.identifier == identifier}){
            pendingRequests.remove(at:index)
            print("Pending: \(pendingRequests.count)")
        }
    }
}



struct LocalNotificationVar{

    internal init (identifier: String,
                   title: String,
                   body: String,
                   dateComponents: DateComponents,
                   repeats: Bool){
        self.identifier = identifier
        self.title = title
        self.body = body
        self.timeInterval = nil
        self.dateComponents = dateComponents
        self.repeats = repeats
            }
    
    var identifier: String
    var title: String
    var body: String
    var timeInterval: Double?
    var dateComponents: DateComponents?
    var repeats: Bool
}

