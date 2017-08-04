//
//  UIViewExtension.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

extension UIView {
 
    func shadowAndRadius(){
    
        self.layer.cornerRadius = 8
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.coolGrey.cgColor
    
    
    }
    
    
}


