//
//  NotificationView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//

import SwiftUI
import UserNotifications
import CoreLocation



class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options){ (success, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                print("success")
            }
            
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Do not forget to wash your face"
        content.subtitle = "Good job!"
        content.sound = .default
        
        //MARK: TRIGGER
        
   //     calendar trigger
        var dateComponents = DateComponents()
        dateComponents.hour = 13
        dateComponents.minute = 16

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        
        //location trigger
        
//
//
//        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.0)
//        let region = CLCircularRegion(
//            center: coordinates,
//            radius: 100,
//            identifier: UUID().uuidString)
//        region.notifyOnEntry = true
//        region.notifyOnExit = false
//
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
//
//
        
        let request = UNNotificationRequest(identifier:UUID().uuidString,
                                            content: content,
                                            trigger: trigger)

        
      
        
        
        
        
        UNUserNotificationCenter.current().add(request)
        
        
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        
    }
    
}
struct NotificationView: View {
    var body: some View {
        VStack{
 
           
        
        Button("Schedule Notification"){
            NotificationManager.instance.requestAuthorization()
            NotificationManager.instance.scheduleNotification()
        }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
