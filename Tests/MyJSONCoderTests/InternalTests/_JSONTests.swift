//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/5/28.
//

import XCTest
@testable import MyJSONCoder
private let data:Data = """
    {
        "name":"yu",
        "jobs":"iOS developer"
    }
""".data(using: .utf8)!
private let arrayJson:Data = #"""
[
    1,
    "2",
    false,
    2.5,
]
"""#.data(using: .utf8)!
struct Level1: Codable {
    var name: String
    var jobs: String
}

class _JSONTests:XCTestCase {
    var jsonDecoder = _JSONDecoder(data: data)
    func testNotNil() {
        XCTAssertNotNil(jsonDecoder.json)
        //        XCTAssertNotNil(jsonDecoder.json["name"])
        //        XCTAssertNotNil(jsonDecoder.json["jobs"])
    }
    var arrayDecoder = _JSONDecoder(data: arrayJson)
    func testArray() {
        XCTAssertNotNil(data)
        let arrayOfAny:[Any]! = arrayDecoder.json as? [Any]
        XCTAssertNotNil(arrayOfAny)
        let array = try? ArrayJson(from: arrayDecoder)
        XCTAssertNotNil(array)
        dump(array)
    }
}

struct ArrayJson:Codable {
    let _0Int:Int
    let _1String:String
    let _2Bool:Bool
    let _3Double:Double
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        _0Int = try container.decode(Int.self)
        _1String = try container.decode(String.self)
        _2Bool = try container.decode(Bool.self)
        _3Double = try container.decode(Double.self)
        
        
    }
}
