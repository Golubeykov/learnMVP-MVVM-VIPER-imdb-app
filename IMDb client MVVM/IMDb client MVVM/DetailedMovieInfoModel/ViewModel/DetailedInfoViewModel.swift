//
//  DetailedInfoViewModel.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 18.09.2022.
//

import UIKit

protocol DetailedInfoViewModelProtocol {
    var movie: Movie { get }
    
    func setLogoForMovie() -> UIImage
    func setTitleForMovie() -> String
    func setDescriptionForMovie() -> String
}

class DetailedInfoViewModel: DetailedInfoViewModelProtocol {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
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
