//
//  JournalViewControllerExtension.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

extension JournalViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            picker.dismiss(animated: true, completion: {
                
                let resizeImage = image.resizeImageWith(newSize: CGSize(width: 375, height: 375))
                self.selectedImage = resizeImage
                self.journalImageView.image = resizeImage
                self.journalImageView.contentMode = .scaleAspectFill
                
            })
            
        }
    }

}
