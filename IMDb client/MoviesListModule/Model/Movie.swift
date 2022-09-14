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


let testMovies: [Movie] = [Movie(name: "Star Wats", description: "JSAjfhaskjdh", image: UIImage(systemName: "pencil") ?? UIImage())]
