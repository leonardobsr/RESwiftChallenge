//
//  NowPlayingView.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 20/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit
import ReSwift

class NowPlayingView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var collectionDataSource: UICollectionViewDataSource?
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let nibName = UINib(nibName: "NowPlayingCollectionViewCell", bundle: nil)
            collectionView.register(nibName, forCellWithReuseIdentifier: "NowPlayingCollectionViewCell")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        Bundle.main.loadNibNamed("NowPlayingView", owner: self, options: nil)
        view.backgroundColor = .white
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    override func awakeFromNib() {
        mainStore.subscribe(self) {
            $0.select {
                $0.nowPlayingMoviesState
            }
        }
        mainStore.dispatch(FetchNowPlayingMoviesAction())
    }
    
    deinit {
        mainStore.unsubscribe(self)
    }
}

extension NowPlayingView: StoreSubscriber {
    
    func newState(state: NowPlayingMoviesState) {
        switch state.movies {
        case .loading:
            let spinner = UIActivityIndicatorView(frame:   CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            spinner.isHidden = false
            spinner.startAnimating()
            self.addSubview(spinner)
            break
        case Result.success(let movies):
            collectionDataSource = CollectionDataSource(cellIdentifier: "NowPlayingCollectionViewCell", models: movies) {cell, model in
                let cell = cell as! NowPlayingCollectionViewCell
                cell.title.text = model.title
                
                if let poster_path = model.poster_path, let vote_average = model.vote_average {
                    cell.rating.setRating(String(vote_average))
                    cell.movieImage.setImage(url: "https://image.tmdb.org/t/p/w1280" + poster_path)
                }
                return cell
            }
            collectionView.dataSource = collectionDataSource
            collectionView.reloadData()
            break
        case .failure(nil):
            let label = UILabel(frame:  CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            label.textColor = .red
            label.backgroundColor = .gray
            self.addSubview(label)
            break
            
        default:
            break
        }
    }
    
    
}
