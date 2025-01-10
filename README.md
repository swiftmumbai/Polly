# Polly

First Sip N Swift project made by Sip N Swift Members of [Swift Mumbai](https://www.bento.me/swiftmumbai) Community

Polly is an iOS application for creating and participating in polls. This project uses Swift, SwiftUI, and CoreData for data persistence.

## Features

- Create and manage polls
- Participate in polls
- View poll results

## Requirements

- Xcode 15.0 or later
- iOS 16.0 or later

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/swiftmumbai/Polly.git
    cd polly
    ```

2. Open the project in Xcode:
    ```sh
    open Polly.xcodeproj
    ```

3. Select the Polly target and choose your preferred simulator or device.

4. Build and run the project:
    ```sh
    cmd + R
    ```

## Installing SwiftLint

SwiftLint is a tool to enforce Swift style and conventions. Follow these steps to install SwiftLint:

1. Install SwiftLint using Homebrew:
    ```sh
    brew install swiftlint
    ```

2. Add a new "Run Script Phase" to your Xcode project:
    - Open your project in Xcode.
    - Select your project in the Project Navigator.
    - Select the target you want to add SwiftLint to.
    - Click on the "Build Phases" tab.
    - Click the "+" button to add a new "Run Script Phase".
    - Add the following script:
        ```sh
        if which swiftlint >/dev/null; then
            swiftlint
        else
            echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
        fi
        ```

For a detailed guide, refer to this [article](https://isnihal.medium.com/simple-guide-to-adding-swiftlint-to-your-xcode-project-11d2ed20da26).

## Using Inject

The [Inject](https://github.com/krzysztofzablocki/Inject?tab=readme-ov-file#integration) tool is a hot reloading workflow helper designed to enhance productivity for developers working with UIKit, AppKit, or SwiftUI. By allowing live coding, it significantly reduces the time spent on compiling and restarting applications, enabling developers to see changes in real-time without the typical deployment delays. This can save developers hours of time each day by minimizing the need to rebuild and re-navigate applications during development.

Refer this [page](https://github.com/krzysztofzablocki/Inject?tab=readme-ov-file#integration) to use Inject

## Contributing

Refer the [CONTRIBUTING.md](https://github.com/swiftmumbai/Polly/blob/main/CONTRIBUTING.md) to know more.

## About Swift Mumbai

Swift Mumbai is an independent community of users focused on Apple's Swift programming language, based in Mumbai, India. They organize events and meetups aimed at bringing together developers to share knowledge, collaborate, and foster a supportive environment for learning and growth in Swift development.

### Follow Us
- [Twitter](https://twitter.com/swift_mumbai)
- [LinkedIn](https://www.linkedin.com/company/swift-mumbai/)
- [Instagram](https://instagram.com/swift_mumbai)