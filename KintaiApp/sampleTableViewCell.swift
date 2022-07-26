//
//  sampleTableViewCell.swift
//  KintaiApp
//
//  Created by 高木克 on 2022/07/26.
//

import UIKit

class sampleTableViewCell: UITableViewCell {

    @IBOutlet weak var kanaTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
