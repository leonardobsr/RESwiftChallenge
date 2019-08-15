//
//  RoutingReducer.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 15/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    let state = state ?? RoutingState() //se o reducer nao consegue transicionar para nenhum estado valido, se mantem no mesmo.
    return state
}
