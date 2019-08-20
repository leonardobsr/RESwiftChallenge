//
//  ErrorView.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 20/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit

class ErrorView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("ErrorView", owner: self, options: nil)
        view.backgroundColor = .white
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        addSubview(view)
    }
    
    func setError(typeError: String) {
        switch typeError {
        case "empty":
            image.image = UIImage(named: "empty")
            title.text = "Oh snap!"
            descLabel.text = "Looks like no movies match your search. Why don't you search for another name?."
        case "offline":
            image.image = UIImage(named: "wifi")
            title.text = "Oops!"
            descLabel.text = "Looks like you are offline. Please check your internet connection."
        case "generic":
            image.image = UIImage(named: "generic")
            title.text = "Oops!"
            descLabel.text = "Looks like an error o curred. Please try again later."
        default:
            image.image = UIImage(named: "generic")
            title.text = "Oops!"
            descLabel.text = "Looks like an error o curred. Please try again later."
        }
    }
}
