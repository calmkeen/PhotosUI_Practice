//
//  ViewModel.swift
//  PhotosUI
//
//  Created by calmkeen on 2022/03/14.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published  var image : UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .libaray
    
    func showPhotoPicker() {
        if source == .camera{
            if !Picker.checkPermissions() {
                print("there is a no camera")
                return
            }
        }
        showPicker = true
    }
}
