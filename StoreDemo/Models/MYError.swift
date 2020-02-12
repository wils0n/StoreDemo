//
//  MYError.swift
//  StoreDemo
//
//  Created by Wilson on 2/11/20.
//  Copyright © 2020 Wilson. All rights reserved.
//

import Foundation

struct MYError : Codable{
    var code : String?
    var description: String?
    var errorType:String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case description
        case errorType
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(String?.self, forKey: .code) ?? ""
        description = try values.decode(String?.self, forKey: .description) ?? ""
        errorType = try values.decode(String?.self, forKey: .errorType) ?? ""
    }
    
    init(code:String?, description:String?, errorType:String?) {
        self.code = code
        self.description = description
        self.errorType = errorType
    }
}
