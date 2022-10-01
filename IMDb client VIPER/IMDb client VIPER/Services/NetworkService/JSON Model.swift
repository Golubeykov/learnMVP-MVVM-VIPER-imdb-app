//
//  JSON Model.swift
//  IMDb client VIPER
//
//  Created by Антон Голубейков on 01.10.2022.
//

import Foundation

struct JSONRoot: Codable {
    let results: [JSONResult]
}

struct JSONResult: Codable {
    let image: String
    let title, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case image, title
        case resultDescription = "description"
    }
}
