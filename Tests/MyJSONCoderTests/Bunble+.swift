//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/5/28.
//

import Foundation

extension Bundle {
    public func getFile(name:String) -> Data! {
        guard
            let url = self.url(
            forResource: name,
            withExtension: "json")
            else {return nil}
        return try? Data(contentsOf: url)
    }
}
