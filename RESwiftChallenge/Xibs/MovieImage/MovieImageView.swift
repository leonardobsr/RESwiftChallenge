//
//  MovieImageView.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 16/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit

class MovieImageView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak internal var view: UIView!
    @IBOutlet weak internal var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("MovieImageView", owner: self, options: nil)
        view.backgroundColor = .black
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        addSubview(view)
    }

}
