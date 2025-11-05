import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var reminderTitle: String = ""
    @State private var reminderDate: Date = Date()
    @State private var message: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Daily Reminder")
                .font(.title)
                .bold()
            
            TextField("Enter reminder title", text: $reminderTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            DatePicker("Select date & time", selection: $reminderDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                .padding(.horizontal)
            
            Button("Schedule Reminder") {
                scheduleNotification(title: reminderTitle, date: reminderDate)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            
            Text(message)
                .foregroundColor(.green)
                .padding(.top)
        }
        .padding()
    }
    
    private func scheduleNotification(title: String, date: Date) {
        let content = UNMutableNotificationContent()
        content.title = title.isEmpty ? "Reminder" : title
        content.body = "This is your scheduled reminder."
        content.sound = .default
        
        let triggerDate = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: date
        )
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            DispatchQueue.main.async {
                if let error = error {
                    message = "Error scheduling: \(error.localizedDescription)"
                } else {
                    message = "Reminder scheduled for \(date.formatted(date: .abbreviated, time: .shortened))"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

