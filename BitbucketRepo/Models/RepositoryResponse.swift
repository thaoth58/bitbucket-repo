//
//  RepositoryResponse.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/25/20.
//

import UIKit

class RepositoryResponse: Codable {
    var pagelen: Int?
    var next: String?
    var repositories: [Repository]
    
    private enum CodingKeys: String, CodingKey {
        case pagelen
        case next
        case repositories = "values"
    }
    
    static func parse(from data: Data) -> RepositoryResponse? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(RepositoryResponse.self, from: data)
        } catch {
            return nil
        }
    }
}
