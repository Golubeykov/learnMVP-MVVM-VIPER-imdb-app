//
//  DetailedInfoPresenter.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import Foundation
import UIKit

protocol MovieDetailedInfoPresenterInput {
    func setView(_ view: MovieDetailedInfoPresenterOutput?)
    
    func setTitleForMovie() -> String
    func setDescriptionForMovie() -> String
    func setLogoForMovie() -> UIImage
}

protocol MovieDetailedInfoPresenterOutput { }

class MoviesDetailedInfoPresenter: MovieDetailedInfoPresenterInput {
    var movie: Movie
    var view: MovieDetailedInfoPresenterOutput? = nil

    init(movie: Movie) {
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

