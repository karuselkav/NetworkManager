//
//  NetworkingType.swift
//  Networking
//
//  Created by Karusel'ka on 25.06.2022.
//

import Foundation


public protocol DecodePresentable {
    func decode<T: Decodable>(data: Data?) throws -> T
}

extension DecodePresentable {
    func decode<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}


extension DecodePresentable {
    public func decode<T: Decodable>(data: Data?) throws -> T {
        guard let data = data else {
            throw HTTPError.dataIsNil
        }
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
