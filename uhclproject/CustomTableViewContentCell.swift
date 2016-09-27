//
//  CustomTableViewContentCell.swift
//  LithologyTable
//
//  Created by Himani Makode on 4/2/16.
//  Copyright © 2016 UHCL. All rights reserved.
//

import UIKit

class CustomTableViewContentCell: UITableViewCell {

    @IBOutlet weak var pressure_label: UILabel!
    @IBOutlet weak var gradient_label: UILabel!
    @IBOutlet weak var LayerName: UILabel!
    @IBOutlet weak var stability_label: UILabel!
    @IBOutlet weak var st_limit_label: UILabel!
    @IBOutlet weak var balance_margin_label: UILabel!
    @IBOutlet weak var tvd_label: UILabel!
    @IBOutlet weak var competent_layer_label: UILabel!
    @IBOutlet weak var layer_type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
