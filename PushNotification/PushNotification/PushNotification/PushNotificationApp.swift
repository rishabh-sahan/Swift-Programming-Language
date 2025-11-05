//
//  PushNotificationApp.swift
//  PushNotification
//
//  Created by BATCH03L1 on 05/11/25.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var navigateTo: String? = nil
}

@main

struct PushNotificationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private  var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .onAppear {
                    AppDelegate.sharedAppState = appState
                    requestNotificationPermission()
                }
        }
    }
    private func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print(error?.localizedDescription ?? "Permission not granted")
            }
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    static var sharedAppState: AppState?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print("Tapped notification userInfo:", userInfo)
        if let extraData = userInfo["extraData"] as? [String: Any],
           let screenName = extraData["screenName"] as? String {
            print("Navigate to screen:", screenName)
            DispatchQueue.main.async {
                AppDelegate.sharedAppState?.navigateTo = screenName
            }
        }
        completionHandler([.banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("Tapped notification userInfo:", userInfo)
        if let extraData = userInfo["extraData"] as? [String: Any],
           let screenName = extraData["screenName"] as? String {
            print("Navigate to screen:", screenName)
            DispatchQueue.main.async {
                AppDelegate.sharedAppState?.navigateTo = screenName
            }
        }
        completionHandler()
    }
}
