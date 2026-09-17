# DHLModalHelper
Helper para modales custom para swiftUI

![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![Platform](https://img.shields.io/badge/iOS-17%2B-blue)

## Preview
![Screenshot](docs/screenshot1.png)

## Installation

### CocoaPods

```ruby
pod 'DHLModalHelper'
```

## Quick Start

### SwiftUI

SetUp:

```swift
DHLModalHelper.shared.setUp(titleFont: FontsHelper.customFont(.big), subtitleFont: FontsHelper.customFont(.normal), buttonsFont: FontsHelper.customFont(.small), buttonsColor: Color.primaryColorApp)
```

Show alert:

```swift
@State private var showCustomModal = false

.showAlert(
    showForgotPasswordModal,
    title: "title",
    subtitle: "subtitle",
    firstButtonText: "first",
    firstButtonAction: {
        showCustomModal = false
      },
    secondButtonText: "second",
    reverseSecondButtonColor: true,
    secondButtonAction: {
        showCustomModal = false
    }
)
```
