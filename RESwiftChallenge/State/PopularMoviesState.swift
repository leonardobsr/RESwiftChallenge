//
//  PopularMoviesState.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 16/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation

import ReSwift

enum Result<T> {
    case loading
    case failed
    case finished(T)
}

typealias Movie = Int

struct PopularMoviesState: StateType {
    var movies: Result<[Movie]> = .loading
}
