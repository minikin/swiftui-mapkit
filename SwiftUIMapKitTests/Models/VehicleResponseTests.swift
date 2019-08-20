//
//  VehicleResponseTests.swift
//  SwiftUIMapKitTests
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

@testable import SwiftUIMapKit
import XCTest
import SwiftUIMapKitServices

// TODO: - Move those tests to SwiftUIMapKitServices
class VehicleResponseTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testDecodingWhenMissingIdKey() throws {
        assertThrowsKeyNotFound("id",
                                decoding: VehicleResponse.self,
                                from: try fixtureOne.json(deletingKeyPaths: "id"))
    }

    func testDecodingWhenMissingNameKey() throws {
        assertThrowsKeyNotFound("name",
                                decoding: VehicleResponse.self,
                                from: try fixtureOne.json(deletingKeyPaths: "name"))
    }

    func testSuccessedDecodingVehicleResponse() throws {
        let vehicleResponse = try JSONDecoder().decode(VehicleResponse.self, from: fixtureOne)
        XCTAssertNotNil(vehicleResponse)
        XCTAssertEqual(vehicleResponse.id, 1)
        XCTAssertEqual(vehicleResponse.name, "000011")
        XCTAssertEqual(vehicleResponse, vehicle)
    }

    func testVehicleResponseNotEqual() throws {
        let vehicleResponse = try JSONDecoder().decode(VehicleResponse.self, from: fixtureTwo)
        XCTAssertNotEqual(vehicleResponse, vehicle)
    }
    
}

private let vehicle = VehicleResponse(id: 1,
                                      name: "000011",
                                      description: "Electric Scooter",
                                      latitude: 52.529077,
                                      longitude: 13.416351,
                                      batteryLevel: 98,
                                      timestamp: "2019-03-10T09:31:56Z",
                                      price: 15,
                                      priceTime: 60,
                                      currency: "€")

private let fixtureOne = Data("""
{
  "id": 1,
  "name": "000011",
  "description": "Electric Scooter",
  "latitude": 52.529077,
  "longitude": 13.416351,
  "batteryLevel": 98,
  "timestamp": "2019-03-10T09:31:56Z",
  "price": 15,
  "priceTime": 60,
  "currency": "€"
}
""".utf8)

private let fixtureTwo = Data("""
{
    "id": 2,
    "name": "000211",
    "description": "Electric Scooter",
    "latitude": 52.529077,
    "longitude": 13.416351,
    "batteryLevel": 98,
    "timestamp": "2019-03-10T09:31:56Z",
    "price": 15,
    "priceTime": 60,
    "currency": "€"
}
""".utf8)
