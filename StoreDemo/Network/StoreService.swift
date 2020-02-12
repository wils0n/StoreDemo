//
//  StoreService.swift
//  StoreDemo
//
//  Created by Wilson on 2/11/20.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class StoreService: NSObject {
    
    static private let queue = DispatchQueue(label: "requests.queue", qos: .utility)
    
    class  func getStores()-> Promise<(json: [Store]?, error: MYError?)>{
        
        let host = K.ProductionServer.baseURL
        let headers = [HTTPHeaderField.contentType.rawValue: ContentType.json.rawValue]
        
        let request = Alamofire.request(host, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
        return makeStores(request: request)
    }
    
    class func makeStores(request: DataRequest) -> Promise <(json: [Store]?, error: MYError?)> {
        return Promise <(json: [Store]?, error: MYError?)> { seal in
            request.responseJSON(queue: queue) { response in
                
                
                switch response.result{
                    
                case .failure(let error):
                    // Network failure
                    if let err = error as? URLError, err.code == .notConnectedToInternet {
                        let _error = MYError(code: Constants.applicationCode.rawValue, description: error.localizedDescription, errorType: Constants.errorNetworkConnection.rawValue)
                        seal.fulfill((nil, _error))
                    } else {
                        // other failures
                        let _error = MYError(code: Constants.applicationCode.rawValue, description: Constants.generalMessage.rawValue, errorType: Constants.errorType.rawValue)
                        seal.fulfill((nil, _error))
                    }
                case .success(_):
                    let data = response.data
                    
                    do{
                        let dictionaryFromJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                        let pathStores = dictionaryFromJSON["stores"] as? NSArray
                        let jsonData = try JSONSerialization.data(withJSONObject: pathStores as Any, options: [])
                        
                        let disheDetail : [Store] = try JSONDecoder().decode([Store].self, from: jsonData)
                        
                        seal.fulfill((disheDetail , nil))
                        
                    } catch {
                        let _error = MYError(code: Constants.applicationCode.rawValue, description: Constants.generalMessage.rawValue, errorType: Constants.errorType.rawValue)
                        seal.fulfill((nil, _error))
                    }
                }
            }
        }
    }
}
