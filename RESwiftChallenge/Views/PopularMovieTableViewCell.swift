//
//  PopularMovieTableViewCell.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 16/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit

class PopularMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
