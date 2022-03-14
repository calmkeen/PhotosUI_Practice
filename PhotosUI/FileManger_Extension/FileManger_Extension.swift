//
//  FileManger_Extension.swift
//  PhotosUI
//
//  Created by calmkeen on 2022/03/14.
//

import Foundation
import UIKit

extension FileManager{
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func docExist(named docName: String) -> Bool{
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
