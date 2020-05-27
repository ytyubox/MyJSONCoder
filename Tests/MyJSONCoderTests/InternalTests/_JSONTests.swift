//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/5/28.
//

import XCTest
@testable import MyJSONCoder
private let data:Data = Bundle(for: _JSONTests.self)
    .getFile(name: "level1")
private let arrayJson:Data = Bundle(for: _JSONTests.self)
.getFile(name: "array")

struct Level1: Codable {
    var name: String
    var jobs: String
}

class _JSONTests:XCTest {
    var jsonDecoder = _JSONDecoder(data: data)
    func testNotNil() {
        XCTAssertNotNil(jsonDecoder.json)
//        XCTAssertNotNil(jsonDecoder.json["name"])
//        XCTAssertNotNil(jsonDecoder.json["jobs"])
    }
    var arrayDecoder = _JSONDecoder(data: arrayJson)
    func testArray() {
        XCTAssertNotNil(data)
        let array:[Any]! = arrayDecoder.json as? [Any]
        XCTAssertNotNil(array)
        
    }
}

