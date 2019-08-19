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

    let numberOfMovies = 4

    var tableDataSource: UITableViewDataSource?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nibName = UINib(nibName: "PopularMovieTableViewCell", bundle: nil)
            tableView.register(nibName, forCellReuseIdentifier: "PopularMovieCell")
            tableView.dataSource = tableDataSource
        }
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
        case Result.finished(let movies):
            tableDataSource = TableDataSource(cellIdentifier: "PopularMovieTableViewCell", models: movies) {cell, model in
                return cell
            }
            tableView.dataSource = tableDataSource
            tableView.reloadData()
            break
        case .failed:
            let label = UILabel(frame:  CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            label.textColor = .red
            self.addSubview(label)
            break
        }
        
    }
}

