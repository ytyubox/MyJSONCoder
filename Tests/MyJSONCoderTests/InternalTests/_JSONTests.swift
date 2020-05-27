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


class _JSONTests:XCTest {
    var jsonDecoder = _JSONDecoder(data: data)
    func testNotNil() {
        XCTAssertNotNil(jsonDecoder.json)
        XCTAssertNotNil(jsonDecoder.json["name"])
        XCTAssertNotNil(jsonDecoder.json["jobs"])
    }
    
}
