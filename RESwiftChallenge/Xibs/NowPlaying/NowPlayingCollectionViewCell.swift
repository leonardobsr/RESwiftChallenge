//
//  NowPlayingCollectionViewCell.swift
//  RESwiftChallenge
//
//  Created by Willian Antunes on 21/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: MovieImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rating: StarView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
