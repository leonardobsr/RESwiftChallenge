//
//  API.swift
//  RESwiftChallenge
//
//  Created by Leonardo Reis on 15/08/19.
//  Copyright © 2019 LeonardoBSR. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error?)
}

enum API<T: Codable> {}

extension API {
    
    // https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc?api_key=bd376c11b6a9bcd6645d26cc74bfe7c3
    
    private var url: String {
        return "https://api.themoviedb.org/3/" + path
    }
    
    private var path: String {
//        switch self {}
    }
    
    private var params: JSON? {
//        switch self {
//        default: return nil
//        }
    }
    
    private var method: HTTPMethod {
//        switch self {
//        default: return nil
//        }
    }
    
    private var headers: HTTPHeaders {
        var header: HTTPHeaders = []
        
//        if let user = User.current, let token = user.sessionToken {
//            header["X-Parse-Session-Token"] = token
//        }
        
        return header
    }
    
    private var encoding: ParameterEncoding {
//        switch self {
//        case: return URLEncoding.default
//        default: return JSONEncoding.default
//        }
    }
    
    @discardableResult
    func request(completion: @escaping ((Result<T>) -> Void)) -> DataRequest {
        var url = self.url
        var params = self.params
        switch self {
//        case .breedList, .specieList:
//            url += "?where=\(params?.convertToJson() ?? "")"
//            url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//            params = nil
//        default: break
        }
        //        print(params)
        return Alamofire.request(url,
                                 method: method,
                                 parameters: params,
                                 encoding: encoding,
                                 headers: headers)
            
            .validate(statusCode: 200...600)
            .responseJSON { response in
                DispatchQueue.main.async {
                    let statusCode = response.response?.statusCode ?? 0
                    switch response.result {
                    case .success(let json) where statusCode >= 200 && statusCode <= 299:
                        guard let result = json as? JSON else {
                            completion(.failure(response.error))
                            return
                        }
                        var objectData: Any = result
                        
                        if let object = result["result"] as? JSON {
                            objectData = object
                        } else if let results = result["result"] as? [JSON] {
                            objectData = results
                        } else if let results = result["results"] as? [JSON] {
                            objectData = results
                        }
                        
                        guard let obj = try? T.fromDictionary(objectData) else {
                            completion(.failure(nil))
                            return
                        }
                        
                        completion(.success(obj))
                    case .success:
                        let error = NSError(domain: "error", code: statusCode, userInfo: nil)
                        completion(.failure(response.error ?? error))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    }
}
