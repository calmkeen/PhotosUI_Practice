//
//  PhotosUIApp.swift
//  PhotosUI
//
//  Created by calmkeen on 2022/03/14.
//

import SwiftUI

@main
struct PhotosUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
                .onAppear{
                    UserDefaults.standard.setValue(false, forKey: "_UIconstraintBasedLayoutLog")
                }
        }
    }
}
