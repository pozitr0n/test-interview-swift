//
//  TableViewCell.swift
//  Test_interview
//
//  Created by Raman Kozar on 12/06/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillTheInfo(inputText: String) {
        mainLabel.text = inputText
    }

}
