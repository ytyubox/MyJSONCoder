import Foundation
class MyJSONCoder {
    
}


struct _JSONDecoder: Decoder {
    
    public init(data:Data, userInfo: [CodingUserInfoKey : Any] = [:]) {
        self.json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
        self.userInfo = userInfo
    }
    
    
    var json: [String: Any]
    
    var codingPath: [CodingKey] = []
    
    var userInfo: [CodingUserInfoKey : Any] = [:]
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        fatalError()
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        fatalError()
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        fatalError()
    }
}
