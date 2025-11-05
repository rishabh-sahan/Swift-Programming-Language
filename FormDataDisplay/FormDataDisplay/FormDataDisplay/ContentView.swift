//
//  ContentView.swift
//  UserDataDisplay
//
//  Created by BATCH03L1 on 25/10/25.
//

import SwiftUI
import SwiftData

@Model
final class UserData {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var email: String
    var branch: String
    
    init(name: String, email: String, branch: String) {
        self.name = name
        self.email = email
        self.branch = branch
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var branch: String = ""
    @State private var navigateToList: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // MARK: - Input Fields
                TextField("Enter Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Enter Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                
                TextField("Enter Branch", text: $branch)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // MARK: - Buttons
                HStack {
                    Button("Save") {
                        saveData()
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                    
                    NavigationLink(destination: UserListView(), isActive: $navigateToList) {
                        Button("View Data") {
                            navigateToList = true
                        }
                        .buttonStyle(BorderedButtonStyle())
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Data Entry Form")
        }
    }
    
    // MARK: - Save Data Function
    func saveData() {
        guard !name.isEmpty, !email.isEmpty, !branch.isEmpty else { return }
        
        let newUser = UserData(name: name, email: email, branch: branch)
        modelContext.insert(newUser)
        try? modelContext.save()
        
        // Clear inputs
        name = ""
        email = ""
        branch = ""
    }
}

struct UserListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [UserData]
    
    var body: some View {
        List {
            ForEach(users) { user in
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name: \(user.name)")
                        .font(.headline)
                    Text("Email: \(user.email)")
                    Text("Branch: \(user.branch)")
                }
                .padding(.vertical, 5)
            }
            .onDelete(perform: deleteUser)
        }
        .navigationTitle("Saved Users")
    }
    
    func deleteUser(at offsets: IndexSet) {
        for index in offsets {
            let user = users[index]
            modelContext.delete(user)
        }
        try? modelContext.save()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: UserData.self)
}
