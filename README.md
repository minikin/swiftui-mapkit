# SwiftUI meets MapKit

SwiftUI meets MapKit is an iOS demo application.

<a href="https://github.com/minikin/swiftui-mapkit"><img src="https://github.com/minikin/swiftui-mapkit/blob/master/assets/iPhone.png?raw=true" alt="map" border="0"></a>

## Meta

**State:** development

**Point People:** [@minikin](https://github.com/minikin)

**CI:** [![Build Status](https://app.bitrise.io/app/693d5288e6e84421/status.svg?token=LSxCFwkI7mKZNc9SVNhM9w)](https://app.bitrise.io/app/693d5288e6e84421)

---

- [SwiftUI meets MapKit](#swiftui-meets-mapkit)
  - [Meta](#meta)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
  - [Installation](#installation)
  - [Running the project](#running-the-project)
  - [Development](#development)
    - [Project Structure](#project-structure)
  - [Run Tests](#run-tests)
  - [Support](#support)
  - [License](#license)

## Requirements

- iOS 13.0+ / macOS 10.14.5+
- Xcode 11.6+
- Swift 5.2+

## Dependencies

In the project I don't use any third party dependencies.

---

## Installation

```sh
git clone https://github.com/minikin/swiftui-mapkit.git && cd swiftui-mapkit
```

---

## Running the project

To run the app from Xcode, open the file `SwiftUIMapKit.xcodeproj` and run the Scheme `SwiftUIMapKit`.
Running from Xcode always launches the app with the build configuration `Debug`.

---

## Development

### Project Structure

In the project folder, there are a few important files:

- `SwiftUIMapKit.xcodeproj`: This is the main Xcode workspace file. To open the project with Xcode, always use this file instead of the project file.

Inside the Xcode project, there are a few separations:

- [`SwiftUIMapKitServices`](https://github.com/minikin/swiftui-mapkit-services) Swift Package
  - Contains foundation sources that are used in multiple components of the app, like a Networking client.
- `SwiftUIMapKit` app target
  - The app target uses `SwiftUIMapKitServices`
  - Inside of the app target, code is separated further with groups
    - There is a group `App` with general app parts used by multiple features, like actions, reducers
    - For each feature (AllVehicles, VehicleDetails, ...) there is an additional group that contains everything that is only necessary for this feature.

---

## Run Tests

The SwiftUIMapKit project contains one unit test target: `SwiftUIMapKitTests`.

- To run all tests from Xcode, select the Scheme `SwiftUIMapKit` and press _CMD_ + _U_ or select test from Xcode's dropdown.

## Support

Post issues and feature requests on the GitHub [issue tracker](https://github.com/minikin/swiftui-mapkit/issues).

## License

ItemsDataSource is released under the MIT license. [See LICENSE](https://github.com/minikin/swiftui-mapkit/blob/master/LICENSE) for details.
