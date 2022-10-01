//
//  MovieDetailedInfoRouter.swift
//  IMDb client VIPER
//
//  Created by Антон Голубейков on 01.10.2022.
//

import UIKit

protocol MovieDetailedInfoRouter {
    func openDetailedMovieInfo(for movie: Movie)
}

extension MovieDetailedInfoRouter where Self: Router {
    func openDetailedMovieInfo(for movie: Movie) {
        let transition = PushTransition(isAnimated: true)
        let router = DefaultRouter(rootTransition: transition)
        let presenter = MoviesDetailedInfoPresenter(movie: movie)
        let viewController = DetailedInfoViewController(presenter: presenter)
        router.root = viewController
        route(to: viewController, as: transition)
    }
}

extension DefaultRouter: MovieDetailedInfoRouter {}
