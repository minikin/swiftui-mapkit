//
//  Environment.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUIMapKitServices

/// Current is the global instance of the Environment.
/// Its purpose is to provide convenient access to the instances that should be shared
/// between different parts of the app (cross-cutting concerns).
/// For more information please check episodes [16](https://www.pointfree.co/episodes/ep16-dependency-injection-made-easy)
/// and [18](https://www.pointfree.co/episodes/ep18-dependency-injection-made-comfortable) of
/// Pointfree and [Stephen Celis's](https://vimeo.com/291588126)
/// talk How to Control the World at NSSpain 2018. Slides of that talk are [also available](https://speakerdeck.com/stephencelis/how-to-control-the-world).
var Current = Environment()

struct Environment {
    let api = API()
    let locationManager = LocationManager()
}
