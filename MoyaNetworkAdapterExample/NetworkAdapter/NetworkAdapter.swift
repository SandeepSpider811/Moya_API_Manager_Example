//
//  APIManager.swift
//  MayoNetworkLayer
//
//  Created by Sierra 2 on 08/08/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

extension Sequence where Iterator.Element == Keys {
    func map(values: [String?]) -> OptionalDictionary {
        var params = [String : Any]()
        
        for (index,element) in zip(self,values) {
            params[index.rawValue] = element
        }
        return params
    }
}

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

struct AuthPlugin: PluginType {
    let token: String
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        return request
    }
}

class NetworkAdapter {
    
    static let shared = NetworkAdapter()
    
    let provider = MoyaProvider<Target>(plugins: [(AuthPlugin(token: /(UserDefaults.standard.value(forKey: "acessToken") as? String))),(NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter))])
    
    func request(target: Target, success successCallback: @escaping (AnyObject) -> Void, error errorCallback: @escaping (Swift.Error) -> Void, failure failureCallback: @escaping (MoyaError) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                let json = JSON.init(data: response.data)
                if let mappedData = self.handle(target, parameters: json) {
                    successCallback(mappedData)
                }
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
    
    func handle(_ api: Target, parameters: JSON) -> AnyObject? {
        switch api {
        case .login(_), .accessTokenLogin(_), .editProfile(_):
            return User(attributes: parameters.dictionaryValue)
        }
    }
}
