//
//  PlanetAPI.swift
//  SyscoTest
//
//  Created by kurupareshan pathmanathan on 5/25/22.
//

import Foundation
import Moya

enum PlanetAPI {
    case getPlanetData
}

extension PlanetAPI: TargetType {
    
    public var baseURL: URL {
        guard let url = URL(string: "https://swapi.dev/api") else { fatalError("base url not configured") }
        return url
    }
    
    public var path: String {
        switch self {
        case .getPlanetData:
            return "/planets/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getPlanetData:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getPlanetData:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        let params = ["Content-Type": "application/json"]
        switch self {
        case .getPlanetData:
            return params
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
