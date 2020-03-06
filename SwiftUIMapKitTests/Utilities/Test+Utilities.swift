//
//  Test+Utilities.swift
//  SwiftUIMapKitTests
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import XCTest

func assertThrowsKeyNotFound<T: Decodable>(_ expectedKey: String,
                                           decoding: T.Type,
                                           from data: Data,
                                           file: StaticString = #file,
                                           line: UInt = #line) {
    XCTAssertThrowsError(try JSONDecoder().decode(decoding, from: data), file: file, line: line) { error in
        if case let .keyNotFound(key, _)? = error as? DecodingError {
            XCTAssertEqual(expectedKey, key.stringValue, "Expected missing key '\(key.stringValue)' to equal '\(expectedKey)'.", file: file, line: line)
        } else {
            XCTFail("Expected '.keyNotFound(\(expectedKey))' but got \(error)", file: file, line: line)
        }
    }
}
