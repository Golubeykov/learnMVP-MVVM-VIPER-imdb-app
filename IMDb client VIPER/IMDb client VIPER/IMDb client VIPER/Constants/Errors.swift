//
//  Errors.swift
//  IMDb client VIPER
//
//  Created by Антон Голубейков on 01.10.2022.
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
