//
//  CardMovieVerticalView.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 19/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit

class CardMovieVerticalView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var movieImageView: MovieImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starView: StarView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("CardMovieVerticalView", owner: self, options: nil)
        view.backgroundColor = .white
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        setImage("https://image.tmdb.org/t/p/w1280/z9S39hH4IOX9Hmtn3zho3Wdqem8.jpg")
        setTitle("Teste")
        isFavorite(false)
        setRating("0,0")
        
        addSubview(view)
    }
    
    func setImage(_ url: String!) {
        movieImageView.setImage(url: url)
    }
    
    func setTitle(_ title: String!) {
        titleLabel.text = title
    }
    
    func isFavorite(_ state: Bool) {
        starView.isFavorite(state)
    }
    
    func setRating(_ rating: String!) {
        starView.setRating(rating)
    }

}
