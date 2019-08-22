//
//  NowPlayingReducer.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 20/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import ReSwift

func nowPlayingMoviesReducer(action: Action, state: NowPlayingMoviesState?) -> NowPlayingMoviesState { //retorna algum dos estados do Enum resultados, sendo o case finished acompanhado do proprio resultado (array de movies)
    
    switch action {
    case _ as FetchNowPlayingMoviesAction:
        fetchNowPlayingMovies()
        break
    case let action as SetNowPlayingMoviesAction:
        return NowPlayingMoviesState(movies: Result.success(action.movies))
    case _ as SetNowPlayingMoviesFailedAction:
        return NowPlayingMoviesState(movies: .failure(nil))
    default:
        break
    }
    return state ?? NowPlayingMoviesState(movies: .loading)
    
}

func fetchNowPlayingMovies() {
    API<[Movie]>.discover(params: "3/discover/movie?sort_by=release_date").request { [] result in
        print(result)
        guard case .success(let movies) = result else {
            mainStore.dispatch(SetNowPlayingMoviesFailedAction())
            return
        }
        mainStore.dispatch(SetNowPlayingMoviesAction(movies: movies))
    }
}
