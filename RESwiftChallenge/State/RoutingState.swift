//
//  RoutingState.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 15/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import ReSwift

struct RoutingState: StateType {
    var navigationState: RoutingDestination
    
    init(navigationState: RoutingDestination = .list) {
        self.navigationState = navigationState
    }
}
