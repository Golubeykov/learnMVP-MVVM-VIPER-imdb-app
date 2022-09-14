//
//  Errors.swift
//  IMDb client
//
//  Created by Антон Голубейков on 14.09.2022.
//

import Foundation

enum Errors: Error {
    case emptyRequest
    case invalidURL
    case networkRequestError
    case JSONDecodeError
    case noDataFromServer
    case unknownError
}
