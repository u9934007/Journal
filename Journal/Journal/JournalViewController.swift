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
    var indexPathRow: Int?

    @IBOutlet weak var journalImageView: UIImageView!
    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var journalContentTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!

    let journalManager = JournalManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        journalManager.delegate = mainViewController

        journalTitleTextField.font = UIFont.textStyle26Font()
        journalContentTextView.font = UIFont.textStyle27Font()
        saveButton.layer.cornerRadius = 22
        saveButton.layer.shadowOpacity = 1
        saveButton.layer.shadowRadius = 10
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        saveButton.layer.shadowColor = UIColor.blush.cgColor

        journalTitleTextField.placeholder = "Title"
        journalContentTextView.placeholderText = "Content"
        journalContentTextView.clipsToBounds = true
        if journalInformation?.title == "" {

            journalImageView.image = UIImage(named: "icon_photo")

        } else {

            journalImageView.image = journalInformation?.image
            journalImageView.contentMode = .scaleAspectFill
            journalContentTextView.clipsToBounds = true
            journalTitleTextField.text = journalInformation?.title
            journalContentTextView.text = journalInformation?.content

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

        if journalImageView.image == UIImage(named: "icon_photo") {

            let alertController = UIAlertController(
                title: "Please select Image",
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

        let changeJournal = JournalStruct(title: journalTitleTextField.text!, content: journalContentTextView.text!, image: journalImageView.image)
        
        if journalInformation?.title == "" {

            journalManager.saveJournal(journal:changeJournal)

        } else {

            journalManager.editJournal(journal: changeJournal, indexPathRow: indexPathRow!)

        }

        self.dismiss(animated: true, completion: nil)

    }

    @IBAction func selectImage(_ sender: Any) {

        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)

    }

}
