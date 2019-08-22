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
        return PopularMoviesState(movies: Result.success(action.movies))
    case _ as SetPopularMoviesFailedAction:
        return PopularMoviesState(movies: .failure(nil))
    default:
        break
    }
    return state ?? PopularMoviesState(movies: .loading)
    
}

func fetchPopularMovies() {
    API<[Movie]>.discover(params: "3/discover/movie?sort_by=popularity").request { [] result in
        print(result)
        guard case .success(let movies) = result else {
            mainStore.dispatch(SetPopularMoviesFailedAction())
            return
        }
        mainStore.dispatch(SetPopularMoviesAction(movies: movies))
    }
}
