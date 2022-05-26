//
//  PlanetViewModel.swift
//  SyscoTest
//
//  Created by kurupareshan pathmanathan on 5/25/22.
//

import Foundation
import Moya

class PlanetViewModel {
    let provider: MoyaProvider<PlanetAPI> = MoyaProvider<PlanetAPI>(manager: DefaultAlamofireManager.sharedManager, plugins: [NetworkLoggerPlugin()])
    var resultArray: [Result] = [Result]()
}

extension PlanetViewModel {
    
    func getData(completion: @escaping(_ status: Bool, _ message: String?) -> Void) {
        provider.request(.getPlanetData) { result in
            switch result {
            case let .success(response):
                do {
                    let responseData = try response.map(PlanetModel.self)
                    self.resultArray = responseData.results
                    completion(true, nil)
                } catch let error{
                    print("error is", error)
                    completion(false, nil)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
