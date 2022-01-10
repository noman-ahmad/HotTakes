//
//  FirebaseStorageManager.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import Foundation
import FirebaseStorage

class FirebaseStorageManager {
    static let shared = FirebaseStorageManager()
    let storageRef = Storage.storage().reference()
    
    
    func uploadImage(image: UIImage, imageID: String) {
        let imageNode = storageRef.child(imageID)
        imageNode.putData(image.pngData()!)
    }
    
}
