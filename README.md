# KDCircularActivityIndicator

[![Version](https://img.shields.io/cocoapods/v/KDCircularActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/KDCircularActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/KDCircularActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/DTCircularActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/KDCircularActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/DTCircularActivityIndicator)

<p align="center">
    <img src ="https://github.com/kaunamohammed/KDCircularActivityIndicator/blob/master/demo.gif" />
</p>

## Installation

KDCircularActivityIndicator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KDCircularActivityIndicator'
```

## Usage
You can easily customize the animation with the following self-descriptive properties:

- `lineWidth`: This property controls the width of the circular stroke path
- `strokeStartDuration`: Duration for stroke start animation
- `strokeEndDuration`: Duration for stroke end animation
- `spinDuration`: Rotating duration for 2pi
- `shouldAutoReverseAnimation`: Indicates whether the animation should be reversed
- `lineDash`: The pattern used to draw the line
- `colors`: The colors to add to the indicator

Initialize the indicator like this or any other way you want
```swift
lazy var activityIndicator: KDCircularActivityIndicator = {
        let indicator = KDCircularActivityIndicator()
        indicator.colors = [.red, .blue]
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
```

Call startAnimating() to you know what 
```swift
activityIndicator.startAnimating()
```

Call stopAnimating() to you also know what 
```swift
activityIndicator.stopAnimating()
```

## Author

This framework was written by Kauna Mohammed. 

## Inspiration
KDCircularActivityIndicator was inspired by an Objective-C framework - [DTCircularActivityIndicator][dtcircularActivityIndicator-objc-url].

The API of KDCircularActivityIndicator has been designed to be as close as possible to DTCircularActivityIndicator for consistency and it's also designed with a swifty feeling ✌🏿. Check out [DTCircularActivityIndicator][dtcircularActivityIndicator-objc-url] if you want a framework with the same functionality in Objective-C.

## License

KDCircularActivityIndicator is available under the MIT license. See the LICENSE file for more info.

[dtcircularActivityIndicator-objc-url]: https://github.com/ducthinh2410/DTCircularActivityIndicator 
