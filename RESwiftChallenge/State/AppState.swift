//
//  AppState.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 14/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import ReSwift
 
struct AppState: StateType {
    let routingState: RoutingState
    let popularMoviesState: PopularMoviesState
    let nowPlayingMoviesState: NowPlayingMoviesState
}
