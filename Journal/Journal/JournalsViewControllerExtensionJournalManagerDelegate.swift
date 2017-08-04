//
//  JournalsViewControllerExtension2.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

extension JournalsViewController: JournalManagerDelegate {

    func manager(_ manager: JournalManager, didGet journals: [Journal]) {

        var journalList: [JournalStruct] = []

        for journal in journals {

            journalList.append(JournalStruct(title:journal.journalTitle!, content: journal.journalContent!, image: UIImage(data:journal.journalImage! as Data)))
        }

        self.journalList = journalList

    }

    func manager(_ manager: JournalManager, didFailWith error: String) {

        print(error)

    }

    func manager(_ manager: JournalManager, didSave journal: JournalStruct) {

        journalList.append(journal)
        journalsTableview.reloadData()

    }

    func manager(_ manager: JournalManager, didEdit journals: [Journal]) {

        var journalList: [JournalStruct] = []

        for journal in journals {

            journalList.append(JournalStruct(title:journal.journalTitle!, content: journal.journalContent!, image: UIImage(data:journal.journalImage! as Data)))
        }

        self.journalList = journalList

        journalsTableview.reloadData()
    }

}
