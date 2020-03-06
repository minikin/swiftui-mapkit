//
//  Data+Extensions.swift
//  SwiftUIMapKitTests
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation

extension Data {
    func json(deletingKeyPaths keyPaths: String...) throws -> Data {
        let decoded = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as AnyObject
        for keyPath in keyPaths { decoded.setValue(nil, forKeyPath: keyPath) }
        return try JSONSerialization.data(withJSONObject: decoded)
    }
}
