//
//  JournalViewController.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit


class JournalViewController: UIViewController {
    
    var passJournalInformation: JournalStruct?
    
    @IBOutlet weak var journalImageView: UIImageView!
    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var journalContentTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        
        journalTitleTextField.font = UIFont.textStyle26Font()
        journalContentTextView.font = UIFont.textStyle27Font()

        
    }
    
    

    @IBAction func pressBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

