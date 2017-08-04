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

        journalManager.delegate = mainViewController

        journalTitleTextField.font = UIFont.textStyle26Font()
        journalContentTextView.font = UIFont.textStyle27Font()
        saveButton.buttonShadow()

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

        let changeJournal = JournalStruct(title: journalTitleTextField.text!,
                                          content: journalContentTextView.text!,
                                          image: journalImageView.image)

        if journalInformation?.title == "" {

            journalManager.saveJournal(journal:changeJournal)

        } else {

            journalManager.editJournal(journal: changeJournal, indexPathRow: indexPathRow!)

        }

        self.dismiss(animated: true, completion: nil)

    }

    @IBAction func selectImage(_ sender: Any) {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        let alertController = UIAlertController(title: "Photo Source",
                                                message: "Choose a source",
                                                preferredStyle: .actionSheet
        )

        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(_: UIAlertAction) in

            if UIImagePickerController.isSourceTypeAvailable(.camera) {

                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)

            } else {

                print("Camera no availabe")

            }

        }))

        alertController.addAction(UIAlertAction(title: "Photo Library",
                                                style: .default,
                                                handler: {(_: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)

        }))

        alertController.addAction(UIAlertAction(title: "Cancel",
                                                style: .default,
                                                handler: nil))

        self.present(alertController, animated: true, completion: nil)

    }

}
