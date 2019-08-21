//
//  NowPlayingMoviesState.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 20/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import ReSwift

struct NowPlayingMoviesState: StateType {
    var movies: Result<[Movie]> = .loading
}
