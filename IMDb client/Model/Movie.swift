//
//  Movie.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import Foundation
import UIKit

struct Movie {
    let name: String
    let description: String
    let image: UIImage
}

class MovieModel {
    var moviesList: [Movie]
    
    init() {
        self.moviesList = []
    }
    
    func loadMoviesWithName(_ name: String, completion: @escaping (Errors?)->Void) {
        findMovies(for: name) { result in
            if case .success(let result) = result {
                self.moviesList = []
                result.results.forEach { [weak self] result in
                    if let url = URL(string: result.image), let image = loadImage(for: url) {
                        let movie = Movie(name: result.title, description: result.resultDescription, image: image)
                        self?.moviesList.append(movie)
                    } else {
                        let movie = Movie(name: result.title, description: result.resultDescription, image: UIImage())
                        self?.moviesList.append(movie)
                    }
                }
                completion(nil)
            } else if case .failure(let error) = result {
                guard let error = error as? Errors else {
                    completion(Errors.unknownError)
                    return
                }
                switch error {
                case .networkRequestError:
                    completion(Errors.networkRequestError)
                case .noDataFromServer:
                    completion(Errors.noDataFromServer)
                case .JSONDecodeError:
                    completion(Errors.JSONDecodeError)
                case .invalidURL:
                    completion(Errors.invalidURL)
                default:
                    completion(Errors.unknownError)
                }
                completion(Errors.unknownError)
            } else {
                completion(Errors.unknownError)
            }
        }
    }
}
