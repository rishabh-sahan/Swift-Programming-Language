//
//  ContentView.swift
//  LocalNotification
//
//  Created by BATCH03L1 on 05/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Local Notification Example")
                .font(.title)
                .padding()
            Button(action: {
                scheduleNotification()
            }) {
                Text("Schedule Notification")
                    .padding()
            }
        }
        .padding()
    }
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "rishabh!"
        content.body = "hello rahul"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("error adding notification: \(error.localizedDescription)")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
