//
//  NetworkService.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import Foundation
import UIKit

let apiKey = "k_il0e4iky"

func searchMovies(for movieNameString: String, completion: @escaping (Result<JSONRoot, Error>) -> Void) {
    let movieNameClearedFromSpaces = movieNameString.replacingOccurrences(of: " ", with: "%")
    
    guard let url = URL(string: "https://imdb-api.com/API/Search/\(apiKey)/\(movieNameClearedFromSpaces)") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = ["accept": "text/plain"]
    request.httpBody = nil
    
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let error = error {
            completion(.failure(error))
        } else {
            guard let data = data else { return }
                guard let jsonResponse = try? JSONDecoder().decode(JSONRoot.self, from: data) else { return }
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
