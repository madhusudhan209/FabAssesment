//
//  FabAssesmentTests.swift
//  FabAssesmentTests
//
//  Created by Madhusudhan on 19/11/19.
//  Copyright © 2019 BankFab. All rights reserved.
//

import XCTest
@testable import FabAssesment

class FabAssesmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInsetringEmptyNewsList() {
        
        var newsListArray1 = [MostViewed]()
        
        let newsObj = MostViewed(dict: [:])
        newsObj.newsID = nil
        newsObj.newsTitle = nil
        newsObj.newsByName = nil
        newsObj.newsDescription = nil
        newsObj.newsPublished = nil
        
        newsListArray1.append(newsObj)
        print("------>",newsListArray1.count)
        
        var newsListArray2 = [MostViewed]()
        newsListArray2.append(newsObj)
        print("------>",newsListArray2.count)
        
        XCTAssertEqual(newsListArray1.count, newsListArray2.count)
        
    }
    
    func testCheckNullValueWithInt() {
        let testString =  String.checkNSNumberNull(123)
        XCTAssertEqual("123", testString)
    }
    
    func testCheckNullValueWithAny() {
        let testString = String.checkNSNumberNull(NSNull())
        XCTAssertEqual("", testString)
    }

}
