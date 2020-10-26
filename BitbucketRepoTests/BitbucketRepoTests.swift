//
//  BitbucketRepoTests.swift
//  BitbucketRepoTests
//
//  Created by Thao Truong on 10/25/20.
//

import XCTest
@testable import BitbucketRepo

class BitbucketRepoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func getDataFrom(fileName name: String) -> Data? {
        if let path = Bundle(for: type(of: self)).path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return data
            } catch {
            }
        }
        return nil
    }
    
    // success-reponse contains 10 repositories
    func testParseFromData_Success() {
        if let successData = getDataFrom(fileName: "success-response") {
            let repositoryResponse = RepositoryResponse.parse(from: successData)
            XCTAssertNotNil(repositoryResponse)
            XCTAssertEqual(repositoryResponse?.repositories.count, 10)
            XCTAssertNotNil(repositoryResponse?.next)
        } else {
            XCTFail("Cannot get success data")
        }
    }
    
    func testParseFromData_Fail_EmptyReponse() {
        if let successData = getDataFrom(fileName: "empty-response") {
            let repositoryResponse = RepositoryResponse.parse(from: successData)
            XCTAssertNil(repositoryResponse)
        } else {
            XCTFail("Cannot get empty data")
        }
    }
    
    // type of values in response is not array, make sure that repositoryReponse is nil
    func testParseFromData_Fail_WrongTypeReponse() {
        if let successData = getDataFrom(fileName: "wrong-type-response") {
            let repositoryResponse = RepositoryResponse.parse(from: successData)
            XCTAssertNil(repositoryResponse)
        } else {
            XCTFail("Cannot get empty data")
        }
    }
}
