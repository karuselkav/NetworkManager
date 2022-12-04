//
//  HTTPMethod.swift
//  GitSearcher
//
//  Created by Karusel'ka on 27.06.2022.
//

import Foundation


public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum HTTPError: Error {
    case urlIsNil
    case dataIsNil
    case valueIsNil
    case statusCodeIsNil
}

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]
