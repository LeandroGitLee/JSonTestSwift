//
//  TableViewCell.swift
//  JSonTesteSwift
//
//  Created by LeandroLee on 2/10/16.
//  Copyright © 2016 goldhandsapp4u. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: -  @IBOulet-
    @IBOutlet weak var ImgIv: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var crmLbl: UILabel!
    @IBOutlet weak var crmUfLbl: UILabel!
    @IBOutlet weak var dateStartLbl: UILabel!
    @IBOutlet weak var birthLbl: UILabel!
    @IBOutlet weak var dateUpdateLbl: UILabel!
    @IBOutlet weak var sexLbl: UILabel!
    @IBOutlet weak var optionLbl: UILabel!
    @IBOutlet weak var activeLbl: UILabel!
    @IBOutlet weak var obsLbl: UILabel!
    @IBOutlet weak var confirmLbl: UILabel!
    
    // MARK: - override -
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
