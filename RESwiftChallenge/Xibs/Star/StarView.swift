//
//  StarsView.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 16/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit

class StarView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var ratingBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("StarView", owner: self, options: nil)
        view.backgroundColor = .white
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        isFavorite(false)
        setRating("0,0")
        
        addSubview(view)
    }
    
    func isFavorite(_ state: Bool) {
        let imageName = (state) ? "star_icon_colored.png" : "star_icon.png"
        if let image = UIImage(named: imageName) {
            ratingBtn.setImage(image, for: .normal)
        }
    }
    
    func setRating(_ rating: String!) {
        ratingBtn.setTitle(rating, for: .normal)
    }

}
