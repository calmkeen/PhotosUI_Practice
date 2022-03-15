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
    @Published var CameraAlert = false
    @Published var CameraError: Picker.CameraErrorType?
    
    
    func showPhotoPicker() {
        do {
            if source == .camera{
                try Picker.checkPermissions()
            }
            showPicker = true
        } catch {
            CameraAlert = true
            CameraError = Picker.CameraErrorType(error: error as! Picker.PickerError)
        }
    }
}
