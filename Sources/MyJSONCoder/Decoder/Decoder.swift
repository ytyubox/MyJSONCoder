//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/5/28.
//

enum Yet:Error {
    case todo
}
import Foundation

struct _JSONDecoder: Decoder {
    
    public init(data:Data, userInfo: [CodingUserInfoKey : Any] = [:]) {
        self.json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        self.userInfo = userInfo
    }
    
    
    var json: Any
    
    var codingPath: [CodingKey] = []
    
    var userInfo: [CodingUserInfoKey : Any] = [:]
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        throw Yet.todo
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        guard let list = json as? [Any] else {
            throw MyDecodingError.dataCorrupted(MyDecodingError.Context(codingPath: [], debugDescription: "json is not array"))
        }
        return MyUnkeyedDecodingContainer(list: list, codingPath: [])
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        throw Yet.todo
    }
}

