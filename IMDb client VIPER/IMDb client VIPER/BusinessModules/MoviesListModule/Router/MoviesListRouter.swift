//
//  MoviesListRouter.swift
//  IMDb client VIPER
//
//  Created by Антон Голубейков on 01.10.2022.
//

import UIKit

protocol MoviesListRouter {
    func openMoviesListView() -> UIViewController
}

extension MoviesListRouter where Self: Router {
    func openMoviesListView() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let presenter = MoviesListPresenter(router: router)
        let viewController = MoviesListViewController(presenter: presenter)
        router.root = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}

extension DefaultRouter: MoviesListRouter {}
