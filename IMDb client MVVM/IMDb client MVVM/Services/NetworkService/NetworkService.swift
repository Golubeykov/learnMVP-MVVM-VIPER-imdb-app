//
//  NetworkService.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 17.09.2022.
//

import Foundation
import UIKit

let apiKey = "k_il0e4iky"

func findMovies(for movieNameString: String, completion: @escaping (Result<JSONRoot, Error>) -> Void) {
    let movieNameClearedFromSpaces = movieNameString.replacingOccurrences(of: " ", with: "%20")

    guard let url = URL(string: "https://imdb-api.com/API/Search/\(apiKey)/\(movieNameClearedFromSpaces)") else {
        completion(.failure(Errors.invalidURL))
        return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = ["accept": "text/plain"]
    request.httpBody = nil
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
        } else {
            guard let data = data else {
                completion(.failure(Errors.noDataFromServer))
                return
            }
            guard let jsonResponse = try? JSONDecoder().decode(JSONRoot.self, from: data) else {
                completion(.failure(Errors.JSONDecodeError))
                return
            }
            completion(.success(jsonResponse))
        }
    }
    task.resume()
}

func loadImage(for url: URL) -> UIImage? {
    guard let data = try? Data(contentsOf: url) else { return nil }
    let image = UIImage(data: data)
    return image
}
