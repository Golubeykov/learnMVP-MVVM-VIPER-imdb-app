//
//  JSONModel.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
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
