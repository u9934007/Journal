//
//  JournalTableViewCell.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    @IBOutlet weak var journalImageView: UIImageView!
    @IBOutlet weak var journalTitleLabel: UILabel!
    @IBOutlet weak var roundView: UIView!

    @IBOutlet weak var shadowView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        roundView.layer.cornerRadius = roundView.frame.size.height/2
        roundView.layer.borderColor = UIColor.coolGrey.cgColor
        roundView.layer.borderWidth = 0.5
        journalImageView.shadowAndRadius()
        journalTitleLabel.font = UIFont.textStyle25Font()
        journalTitleLabel.textColor = UIColor.slate
        shadowView.shadowAndRadius()
    }

}
