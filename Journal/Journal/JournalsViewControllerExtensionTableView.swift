//
//  JournalsViewControllerExtensionTableView.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

extension JournalsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as! JournalTableViewCell
        // swiftlint:disable:previous force_cast

        cell.journalTitleLabel.text = journalList[indexPath.row].title
        cell.journalImageView.image = journalList[indexPath.row].image
        cell.selectionStyle = .none
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        passJournalInformation = journalList[indexPath.row]

    }

}
