//
//  CustomCellTableViewCell1.swift
//  Sieve Analysis
//
//  Created by Justin Espejo on 3/2/16.
//  Copyright © 2016 Snowcialite. All rights reserved.
//

import UIKit

class CustomCellTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
