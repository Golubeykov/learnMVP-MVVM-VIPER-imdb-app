//
//  Constants.swift
//  IMDb client MVVM
//
//  Created by Антон Голубейков on 17.09.2022.
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
