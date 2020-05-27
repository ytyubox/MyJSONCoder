//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/5/28.
//

import Foundation

struct MyUnkeyedDecodingContainer: UnkeyedDecodingContainer {
    let list: [Any]
    var codingPath: [CodingKey]
    
    var count: Int?
    
    var isAtEnd: Bool {list.count > currentIndex}
    
    var currentIndex: Int = 0
    
    
    mutating func decodeNil() throws -> Bool {
        fatalError()
    }
    
   
    mutating func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        guard isAtEnd else {fatalError()}
        defer {
            currentIndex += 1
        }
        guard let value = list[currentIndex] as? T
            else {
                let it = list[currentIndex]
                throw MyDecodingError.typeMismatch(type, MyDecodingError.Context(
                codingPath: codingPath,
                debugDescription:
                "currect value should be \(type) but found \(it)" ))}
        return value
    }
    
    mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        fatalError()
    }
    
    mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        fatalError()
    }
    
    mutating func superDecoder() throws -> Decoder {
        fatalError()
    }
    
    
}
