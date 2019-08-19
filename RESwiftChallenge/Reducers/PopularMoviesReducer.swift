//
//  PopularMoviesReducer.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 16/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import ReSwift

func popularMoviesReducer(action: Action, state: PopularMoviesState?) -> PopularMoviesState { //retorna algum dos estados do Enum resultados, sendo o case finished acompanhado do proprio resultado (array de movies)
    
    switch action {
    case _ as FetchPopularMoviesAction:
        fetchPopularMovies()
        break
    case let action as SetPopularMoviesAction:
        return PopularMoviesState(movies: Result.finished(action.movies))
    case _ as SetPopularMoviesFailedAction:
        return PopularMoviesState(movies: .failed)
    default:
        break
    }
    return state ?? PopularMoviesState(movies: .loading)
    
}

func fetchPopularMovies() {
//    let movies = [1]
//    DispatchQueue.main.async {
//        mainStore.dispatch(SetPopularMoviesAction(movies: movies ?? []))
//    }
}
