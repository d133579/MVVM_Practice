//
//  SiteTableViewCell.swift
//  MVVM_Practice
//
//  Created by 文 on 2018/2/19.
//  Copyright © 2018年 文. All rights reserved.
//

import UIKit

class SiteTableViewCell: UITableViewCell {

    @IBOutlet weak var siteLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var avaliableBikeLabel: UILabel!
    
    @IBOutlet weak var avaliableSpaceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateWithPresenfter(presenter:CellPresentable) {
        presenter.updateCell(cell: self)
    }
}
