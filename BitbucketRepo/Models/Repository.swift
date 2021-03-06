//
//  Repository.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/25/20.
//

import UIKit

class Repository: NSObject, Codable {
    var name: String?
    var type: String?
    var createdDate: String?
    var owner: Owner?
    var website: String?
    var language: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case createdDate = "created_on"
        case owner
        case website
        case language
    }
}
