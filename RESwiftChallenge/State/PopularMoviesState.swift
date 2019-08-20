//
//  PopularMoviesState.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 16/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation

import ReSwift

struct PopularMoviesState: StateType {
    var movies: Result<[Movie]> = .loading
}
