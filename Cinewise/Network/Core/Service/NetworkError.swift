//
//  NetworkError.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

enum NetworkError: String, Error {
    case badURL
    case badResponse
    case unauthorized
    case unexpectedStatusCode
    case badData
    case decoding
}
