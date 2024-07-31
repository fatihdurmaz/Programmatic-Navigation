//
//  SettingsView.swift
//  Programmatic Navigation
//
//  Created by Fatih Durmaz on 31.07.2024.
//

import SwiftUI
import Lottie

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var selectedTheme = 0
    @State private var volumeLevel: Double = 50
    @Environment(Router.self) private var router

    var body: some View {
        VStack {
            Form {
                
                LottieView(animation: .named("animation"))
                    .looping()
                    .frame(maxWidth: .infinity)
                
                Toggle(isOn: $notificationsEnabled) {
                    Text("Enable Notifications")
                }
                
                Picker(selection: $selectedTheme, label: Text("Theme")) {
                    Text("Light").tag(0)
                    Text("Dark").tag(1)
                    Text("System").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Text("Volume")
                    Slider(value: $volumeLevel, in: 0...100)
                }
                
                Button(action: {
                    // Save action
                    print("Settings saved")
                }) {
                    Text("Save Settings")
                        .foregroundColor(.blue)
                }
                .navigationTitle("Settings")
                .toolbar {
                    ToolbarItem {
                        Button("Go to Root"){
                            router.navigateToRoot()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environment(Router())
}
