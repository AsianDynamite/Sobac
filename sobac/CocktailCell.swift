//
//  CocktailCell.swift
//  sobac
//
//  Created by Nate Henry on 11/13/16.
//  Copyright © 2016 Nate Henry. All rights reserved.
//

import UIKit

class CocktailCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
