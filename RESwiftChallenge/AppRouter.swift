//
//  AppRouter.swift
//  RESwiftChallenge
//
//  Created by Eduardo Ribeiro on 15/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import ReSwift

enum RoutingDestination: String {
    case list = "ListViewController"
    case movieDetail = "MovieDetailViewController"
    case nowPlayingSeeAll = "NowPlayingSeeAllViewController"
    case search = "SearchViewController"
}

final class AppRouter {
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        // AppState now subscribes to the global store. In the closure, select indicates you are specifically subscribing to changes in the routingState.
        mainStore.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
    }
    
    // pushViewController will be used to instantiate and push a given view controller onto the navigation stack. It uses instantiateViewController, which loads the view controller based on the passed identifier.
    fileprivate func pushViewController(identifier: String, animated: Bool) {
        let viewController = instantiateViewController(identifier: identifier)
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    private func instantiateViewController(identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: - StoreSubscriber
// Make the AppRouter conform to StoreSubscriber to get newState callbacks whenever routingState changes.
extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        // You don’t want to animate the root view controller, so check if the current destination to push is the root.
        let shouldAnimate = navigationController.topViewController != nil
        // When the state changes, you push the new destination onto the UINavigationController using the rawValue of state.navigationState, which is the name of the view controller.
        pushViewController(identifier: state.navigationState.rawValue, animated: shouldAnimate)
    }
}
