//
//  APISettings.swift
//  LOTR App
//
//  Created by Latif Atci on 7/6/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import Foundation

enum HttpMethod: String {

    case get = "GET"
    case post = "POST"
}

protocol APISetting {

    var httpMethod: HttpMethod { get }
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [String: Any] { get }
}

extension APISetting {
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "the-one-api.herokuapp.com"
    }
    
    var parameters: [String: Any] {
        return [:]
    }
    
    func createURLString() -> String {
        return "\(scheme)://\(host)\(path)"
    }
    
    func createURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        let token = "xne8nH1yI9iReXv2XoYb"
        if let url = components.url {
            var request = URLRequest(url: url)
            request.addValue(token, forHTTPHeaderField: "Authorization")
            return request
        } else {
            return nil
        }
    }
}

