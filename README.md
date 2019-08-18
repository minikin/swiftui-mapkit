# SwiftUI meets MapKit

SwiftUI meets MapKit is an iOS demo application.

## Meta

**State:** development

**Point People:** [Sasha Prokhorenko](mailto: djminikin@gmail.com)

**CI:** _ci status_

---

- [Requirements](#requirements)
- [Installation](#installation)
- [Running the project](#running-the-project)
- [Development](#development)
- [Run Tests](#run-tests)

## Requirements

- iOS 13.0+ / macOS 10.14.5+
- Xcode 11.0 beta 5
- Swift 5.1+

## Dependencies

In the project we don't use any third party dependencies.

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

- `Service` framework (_not separate as framework yet_)
  - Contains foundation sources that are used in multiple components of the app, like a HTTP client.
- `SwiftUIMapKit` app target
  - The app target, that uses `Service` internally
  - Inside of the app target, code is separated further with groups
    - There is a group `App` with general app parts used by multiple features, like actions, reducers
    - For each feature (AllVehicles, VehicleDetails, , ...) there is an additional group that contains everything that is only necessary for this feature.

---

## Run Tests

The SwiftUIMapKit project contains one unit test target: `SwiftUIMapKitTests`.

- To run all tests from Xcode, select the Scheme `SwiftUIMapKit` and press _CMD_ + _U_ or select test from Xcode's dropdown.

---