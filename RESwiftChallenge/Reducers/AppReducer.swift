//
//  AppReducer.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 14/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer : Reducer<ReducerStateType> {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
//            favoritesState: FavoriteReducer().handleAction(action: action, state: state?.favoritesState),
//            fetchedCharactersState: FetchedCharactersReducer(apiManager: apiManager)
//                .handleAction(action: action, state: state?.fetchedCharactersState)
        )
    }
}
