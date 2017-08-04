//
//  JournalViewController.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController {

    var journalInformation: JournalStruct?

    @IBOutlet weak var journalImageView: UIImageView!
    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var journalContentTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        journalTitleTextField.font = UIFont.textStyle26Font()
        journalContentTextView.font = UIFont.textStyle27Font()
        saveButton.layer.cornerRadius = 22
        saveButton.layer.shadowOpacity = 1
        saveButton.layer.shadowRadius = 10
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        saveButton.layer.shadowColor = UIColor.blush.cgColor

        journalTitleTextField.placeholder = "Title"
        journalContentTextView.placeholderText = "Content"

        if journalInformation?.title != ""{

        }
    }

    @IBAction func pressBack(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)

    }

    @IBAction func pressSave(_ sender: Any) {

        if journalTitleTextField.text == "" {

            let alertController = UIAlertController(
                title: "Please enter title",
                message: "",
                preferredStyle: .alert)

            let cancelAction = UIAlertAction(
                title: "ok",
                style: UIAlertActionStyle.default,
                handler: nil)

            alertController.addAction(cancelAction)
            // 顯示提示框
            self.present(
                alertController,
                animated: true,
                completion: nil)

            return

        }

        if journalContentTextView.text == "" {

            let alertController = UIAlertController(
                title: "Please enter content",
                message: "",
                preferredStyle: .alert)

            let cancelAction = UIAlertAction(
                title: "ok",
                style: UIAlertActionStyle.default,
                handler: nil)

            alertController.addAction(cancelAction)
            // 顯示提示框
            self.present(
                alertController,
                animated: true,
                completion: nil)

            return

        }

        self.dismiss(animated: true, completion: nil)

    }

}
