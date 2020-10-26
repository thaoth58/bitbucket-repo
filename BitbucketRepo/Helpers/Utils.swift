//
//  Utils.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/25/20.
//

import Foundation

extension String {
    func convertDateFormat(from: String, to: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = to
            return dateFormatter.string(from: date)
        }
        return self
    }
    
    func displayText() -> String {
        if !self.isEmpty {
            return self
        }
        return "N/A"
    }
}
