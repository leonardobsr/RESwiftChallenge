//
//  PopularMoviesView.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 16/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit
import ReSwift

class PopularMoviesView : UIView {

    var tableDataSource: UITableViewDataSource?
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nibName = UINib(nibName: "PopularMovieTableViewCell", bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: "PopularMovieTableViewCell")
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
        Bundle.main.loadNibNamed("PopularMoviesView", owner: self, options: nil)
        view.backgroundColor = .white
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }

    override func awakeFromNib() {
        mainStore.subscribe(self) {
            $0.select { 
                $0.popularMoviesState
            }
        }
        mainStore.dispatch(FetchPopularMoviesAction())
    }
    
    deinit {
        mainStore.unsubscribe(self)
    }
    
}

// MARK: - StoreSubscriber
extension PopularMoviesView: StoreSubscriber {
    
    func newState(state: PopularMoviesState) {
        //This is the declarative part. It’s where you populate the UITableView. You can clearly see in code how state is transformed into view.
        
        switch state.movies {
        case .loading:
            let spinner = UIActivityIndicatorView(frame:   CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            spinner.isHidden = false
            spinner.startAnimating()
            self.addSubview(spinner)
            break
        case Result.success(let movies):
            tableDataSource = TableDataSource(cellIdentifier: "PopularMovieTableViewCell", models: movies) {cell, model in
                let cell = cell as! PopularMovieTableViewCell
                cell.title.text = model.title
                cell.descriptionText.text = model.overview
                cell.descriptionText.isEditable = false
                
                if let poster_path = model.poster_path, let vote_average = model.vote_average {
                    cell.rating.setRating(String(vote_average))
                    cell.movieImage.setImage(url: "https://image.tmdb.org/t/p/w1280" + poster_path)
                }
                return cell
            }
            tableView.dataSource = tableDataSource
            tableView.reloadData()
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

