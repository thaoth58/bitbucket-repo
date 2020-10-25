//
//  NetworkManager.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/25/20.
//

import Foundation
import Alamofire

let baseURL = "https://api.bitbucket.org/2.0/repositories"
let commonError = "Something went wrong. Please try again!"

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {
    }
    
    func getListRepository(url: String, completion: @escaping (RepositoryResponse?, String?) -> Void) {
        AF.request(url).response { response in
            if let data = response.data,
               let repositoryResponse = RepositoryResponse.parse(from: data) {
                completion(repositoryResponse, nil)
            } else {
                completion(nil, response.error?.localizedDescription ?? commonError)
            }
        }
    }
}
