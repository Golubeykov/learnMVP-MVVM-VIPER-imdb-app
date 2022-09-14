//
//  MoviesListPresenter.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import Foundation
import UIKit

protocol MoviesListPresenterInput {
    func setView(_ view: MoviesListPresenterOutput?)
    
    var numberOfRows: Int { get }
    
    func titleForMovieAt(_ index: Int) -> String
    func descriptionForMovieAt(_ index: Int) -> String
    func imageForMovieAt(_ index: Int) -> UIImage
    
    func didSelectMovieAt(_ index: Int)
}

protocol MoviesListPresenterOutput {
    func openMoviesListView(movie: Movie)
}

class MoviesListPresenter: NSObject, MoviesListPresenterInput {
    var view: MoviesListPresenterOutput? = nil
    var model = MovieModel()
    
    func getMovies(name: String,completion: @escaping () -> Void) {
        let nameFormattedForNetworkRequest = name.replacingOccurrences(of: " ", with: "%")
        model.loadMoviesWithName(nameFormattedForNetworkRequest) {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    var numberOfRows: Int {
        return model.moviesList.count
    }
    
    func setView(_ view: MoviesListPresenterOutput?) {
        self.view = view
    }
    
    func titleForMovieAt(_ index: Int) -> String {
        let movie = model.moviesList[index]
        return movie.name
    }
    
    func descriptionForMovieAt(_ index: Int) -> String {
        let movie = model.moviesList[index]
        return movie.description
    }
    
    func imageForMovieAt(_ index: Int) -> UIImage {
        let movie = model.moviesList[index]
        return movie.image
    }
    
    func didSelectMovieAt(_ index: Int) {
        let movie = model.moviesList[index]
        view?.openMoviesListView(movie: movie)
    }
}
