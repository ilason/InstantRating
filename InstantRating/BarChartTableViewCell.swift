//
//  BarChartTableViewCell.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/31/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import UIKit
import Charts

class BarChartTableViewCell: UITableViewCell {

    @IBOutlet weak var barChartView: BarChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
