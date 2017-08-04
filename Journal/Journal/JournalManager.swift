//
//  JournalManager.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit
import CoreData

protocol JournalManagerDelegate: class {

    func manager(_ manager: JournalManager, didGet journals: [Journal])
    func manager(_ manager: JournalManager, didFailWith error: String)
    func manager(_ manager: JournalManager, didSave journal: JournalStruct)
    func manager(_ manager: JournalManager, didEdit journals: [Journal])

}

class JournalManager {

    weak var delegate: JournalManagerDelegate?

    // swiftlint:disable:next force_cast
    var managedObjectContext: NSManagedObjectContext! = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // swiftlint:disable:previous force_cast

    func getJournals() {

        var journalList = [Journal]()
        let JournalRequest: NSFetchRequest<Journal> = Journal.fetchRequest()

        do {
            journalList = try managedObjectContext.fetch(JournalRequest)
            self.delegate?.manager(self, didGet: journalList)

        } catch {

            self.delegate?.manager(self, didFailWith: error.localizedDescription)
        }

    }

    func saveJournal(journal: JournalStruct) {

        do {

            let saveJournal = Journal(context: managedObjectContext)
            saveJournal.journalImage = NSData(data: UIImagePNGRepresentation(journal.image!)!)
            saveJournal.journalContent = journal.content
            saveJournal.journalTitle = journal.title
            try self.managedObjectContext.save()
            self.delegate?.manager(self, didSave: journal)

        } catch {
            self.delegate?.manager(self, didFailWith: error.localizedDescription)
        }

    }

    func editJournal(journal: JournalStruct, indexPathRow: Int) {

        var journalList = [Journal]()
        let JournalRequest: NSFetchRequest<Journal> = Journal.fetchRequest()

        do {

            journalList = try managedObjectContext.fetch(JournalRequest)
            journalList[indexPathRow].journalImage = NSData(data: UIImagePNGRepresentation(journal.image!)!)
            journalList[indexPathRow].journalContent = journal.content
            journalList[indexPathRow].journalTitle = journal.title

            try self.managedObjectContext.save()
            self.delegate?.manager(self, didEdit: journalList)

        } catch {
            self.delegate?.manager(self, didFailWith: error.localizedDescription)
        }

    }

    func deleteJournal(indexPathRow: Int) {

        var journalList = [Journal]()
        let JournalRequest: NSFetchRequest<Journal> = Journal.fetchRequest()

        do {

            journalList = try managedObjectContext.fetch(JournalRequest)
            managedObjectContext.delete(journalList[indexPathRow])
            try self.managedObjectContext.save()
            journalList.remove(at: indexPathRow)
            self.delegate?.manager(self, didEdit: journalList)

        } catch {
            self.delegate?.manager(self, didFailWith: error.localizedDescription)
        }

    }

}
