//
//  DetailedInfoPresenter.swift
//  IMDb client VIPER
//
//  Created by Антон Голубейков on 01.10.2022.
//

import UIKit

protocol MovieDetailedInfoPresenterInput {
    var movie: Movie { get set }
    func setView(_ view: MovieDetailedInfoPresenterOutput?)

    func setTitleForMovie() -> String
    func setDescriptionForMovie() -> String
    func setLogoForMovie() -> UIImage
}

protocol MovieDetailedInfoPresenterOutput { }

class MoviesDetailedInfoPresenter: MovieDetailedInfoPresenterInput {
    var movie: Movie
    var view: MovieDetailedInfoPresenterOutput? = nil

    init(movie: Movie, detailedInfoRouter: Router) {
        self.movie = movie
    }

    func setView(_ view: MovieDetailedInfoPresenterOutput?) {
        self.view = view
    }

    func setTitleForMovie() -> String {
        return movie.name
    }
    func setDescriptionForMovie() -> String {
        return movie.description
    }
    func setLogoForMovie() -> UIImage {
        return movie.image
    }
}
