//
//  AppReducer.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 14/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import ReSwift

func AppReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        routingState: routingReducer(action: action, state: state?.routingState)
    )
}
