//
//  Picker.swift
//  PhotosUI
//
//  Created by calmkeen on 2022/03/14.
//

import Foundation
import SwiftUI

enum Picker {
    enum Source: String {
         case libaray,camera
    }
    
    static func checkPermissions() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            return true
            
        }else {
            return false
        }
    }
}
