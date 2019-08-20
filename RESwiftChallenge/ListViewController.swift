//
//  ViewController.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 14/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        API<[Movie]>.discover(params: "3/discover/movie?sort_by=popularity.desc").request { [weak self] result in
            print(result)
            guard case .success(let movies) = result else {
                print("Erro, tente novamente mais tarde!")
                return
            }
            
            print(movies)
        }
    }


}

