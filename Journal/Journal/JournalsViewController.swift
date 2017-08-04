//
//  JournalsViewController.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

class JournalsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var journalList: [JournalStruct] = []
    var passJournalInformation: JournalStruct?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        titleLabel.font = UIFont.textStyle24Font()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "check" || segue.identifier == "build" {
            
            // swiftlint:disable:next force_cast
            let viewController = segue.destination as! JournalViewController
            // swiftlint:disable:previous force_cast
            viewController.journalInformation = self.passJournalInformation
        
        }

      

    }

}
