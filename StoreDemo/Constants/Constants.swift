//
//  Constants.swift
//  StoreDemo
//
//  Created by Wilson on 2/11/20.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation
import Alamofire

struct K {
    struct ProductionServer {
        static let baseURL = "http://sandbox.bottlerocketapps.com/BR_Android_CodingExam_2015_Server/stores.json"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

enum Constants: String {
    case applicationCode = "STR"
    case errorNetworkConnection = "-1009"
    case generalMessage = "Por favor, vuelta a intentarlo"
    case errorType = "-1"
}
