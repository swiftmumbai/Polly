//
//  OnBoardingView.swift
//  Polly
//
//  Created by Sarvesh Doshi on 12/04/25.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State private var username: String = ""
    @State private var notificationsEnabled: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Your Info")) {
                        TextField("Name", text: $username)
                            .autocapitalization(.words)
                    }
                    
                    Section(header: Text("Preferences")) {
                        Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    }
                    
                    Button("Get Started") {
                        // TODO: Add saving username, Navigation to next screen.
                    }
                    .disabled(username.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .formStyle(.grouped)
                Spacer()
                Text("❤️ from Swift Mumbai Team")
            }
            .navigationTitle("Welcome")
        }
    }
}

#Preview {
    OnBoardingView()
}
