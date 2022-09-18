//
//  MoviesListViewModel.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 18.09.2022.
//

import UIKit

protocol MoviesListViewModelProtocol {
    var moviesLoadedSignal: BindingBox<[Movie]> { get }
    var moviesLoadErrorSignal: BindingBox<Errors?> { get }
    var openMovieSignal: BindingBox<Movie?> { get }
    
    func getMovies(name: String)

    func didSelectMovieAt(_ indexPath: Int)
}

class MoviesListViewModel: NSObject, MoviesListViewModelProtocol {
    private let model = MovieModel()
    
    var moviesLoadedSignal: BindingBox<[Movie]> = BindingBox([])
    var moviesLoadErrorSignal: BindingBox<Errors?> = BindingBox(nil)
    var openMovieSignal: BindingBox<Movie?> = BindingBox(nil)
    
    func getMovies(name: String) {
        guard name != "" else {
            moviesLoadErrorSignal.value = Errors.emptyRequest
            return
        }
        model.loadMoviesWithName(name) { error in
            guard error != nil else {
                DispatchQueue.main.async { [weak self] in
                    self?.moviesLoadedSignal.value = self?.model.moviesList ?? []
                }
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.moviesLoadErrorSignal.value = Errors.networkRequestError
            }
        }
    }
    
    func didSelectMovieAt(_ indexPath: Int) {
        let movie = model.moviesList[indexPath]
        openMovieSignal.value = movie
    }
    
    
    
}
