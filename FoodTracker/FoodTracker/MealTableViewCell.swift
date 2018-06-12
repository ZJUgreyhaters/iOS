//
//  MealTableViewCell.swift
//  FoodTrackerTests
//
//  Created by Developer on 2018/5/1.
//  Copyright © 2018年 Developer. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceTime: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
