//
//  NetworkingManager.swift
//  Networking
//
//  Created by Karusel'ka on 25.06.2022.
//

import Foundation

public class NetworkingManager : DecodePresentable {
    
    let session = URLSession.shared
    
    public init() {}
    
    public func requestDecodable<M: Decodable>(request: URLRequest,
                                        onSuccess:@escaping (M) -> Void,
                                        onError:@escaping (Error) -> Void) {
        
        let sessionTask = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                onError(error!)
                return
            }
            self.debugPrintResponse(request: request)
            
            
            do {
                let object: M = try self.decode(data: data)
                onSuccess(object)
            } catch {
                onError(error)
            }
        }
        sessionTask.resume()
        
    }
    
    public func debugPrintResponse(request: URLRequest) {
        debugPrint(request.url?.absoluteString ?? "")
        
        debugPrint("httpMethod")
        debugPrint(request.httpMethod ?? "")
        debugPrint("allHTTPHeaderFields")
        debugPrint(request.allHTTPHeaderFields ?? "")
        debugPrint("httpBody")
        if let httpBody = request.httpBody {
            debugPrint(String(data: httpBody, encoding: String.Encoding.utf8) ?? "")
        }
    }
}


