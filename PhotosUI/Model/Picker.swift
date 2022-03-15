//
//  Picker.swift
//  PhotosUI
//
//  Created by calmkeen on 2022/03/14.
//

import Foundation
import SwiftUI
import AVFAudio
import AVFoundation


enum Picker {
    enum Source: String {
         case libaray,camera
    }
    
enum PickerError: Error, LocalizedError{
    case unavailable
    case restrected
    case denied
    
    var errorDescription: String?{
        switch self {
        case .unavailable:
            return NSLocalizedString("there is no available camera on this device", comment: "")
        case .restrected:
            return NSLocalizedString("You are not allowed to access media capture device", comment: "")
        case .denied:
            return NSLocalizedString("permission denied", comment: "")
        }
    }
}


    
    static func checkPermissions()throws {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let authStatus =  AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .denied:
                throw PickerError.denied
            case .restricted:
                throw PickerError.restrected
            default:
                break
            }
        } else {
            throw PickerError.unavailable
        }
    }

    struct CameraErrorType{
        let error: Picker.PickerError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel){}
    }
}
