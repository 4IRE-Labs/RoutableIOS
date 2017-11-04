## RoutableIOS

[![Platforms](https://img.shields.io/cocoapods/p/RoutableIOS.svg)](https://cocoapods.org/pods/RoutableIOS)
[![License](https://img.shields.io/cocoapods/l/RoutableIOS.svg)](https://raw.githubusercontent.com/seductive-mobile/RoutableIOS/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/RoutableIOS.svg)](https://cocoapods.org/pods/RoutableIOS)

[![Travis](https://img.shields.io/travis/seductive-mobile/RoutableIOS/master.svg)](https://travis-ci.org/seductive-mobile/RoutableIOS/branches)
[![JetpackSwift](https://img.shields.io/badge/JetpackSwift-framework-red.svg)](http://github.com/JetpackSwift/Framework)

Efficient way to manage routing in your app!

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)


Feeling weird while doing some routing between tabs in iOS or just using navigation controllers?

RoutableIOS - makes routing in your app more efficient and elegant. It is a very simple and powerful tool to manage changing between tabs in your application or just moving within stack in your UINavigationController. All you need to do is just to set which event name each of your tabs can open.

So, just imagine, you have an IOS app and the app has several tabs. No matter what you use UITabBarController, a Side Menu or other pods give you such functional.
Your application has three or more tabs: «Feed», «Dialogs», «Settings».

Example 1: You open the app, go to «Feed» then find a great post and now you want to contact the author of the article. So you open his profile and see a button saying «Chat with Author». When you tap on it your application redirects you to «Dialogs» tab and opens the chat with this Author.

![RoutableIOS: Elegant Routable in Swift](https://github.com/SeductiveMobile/RoutableIOS/blob/master/routable_ios_example.png?raw=true)

### Definitions: 

- UIViewControllers - all blue blocks
- UITabBarController - green block
- UINavigationControllers - all tall colored blocks


Example 2: Now you are on a tab and your application suggests you to do some modifications, for example, in the app settings (In «Settings» tab).

So, there are a lot of situations when you have to manage your routing between different tabs in an efficient way and traditional methods are not very useful, furthermore, in some situations are too nasty to want to use them.

It can be solved by using just notifications or delegates or using other tools, but what if we add more conditions? 

Here are some of them:

you want to open your array of ViewControllers on a specific tab from any screen after the root ViewController; 
you want to replace the whole ViewControllers stack in a specific tab with your own ones; 
you want to add some ViewControllers after a specific UIViewController that is already presented in a current stack and etc. 

It can still be resolved by traditional methods, but it becomes much uglier, there is more and more code.

In general, we create observers somewhere in the instance of YourTabBarController and delegate this work to it. As a result you have a huge YourTabBarController class. Yes, we can divide it into different files, but it will not save us. 


### Why routableIOS?

- It is simple to use
- You don’t need any inheritance from framework’s files!
- Elegant way to manage switching between tabs
- Incredible decision to move/extend stacks in UINavigationControllers


## Requirements

- iOS 8.0+ / Mac OS X 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build RoutableIOS 0.0.1+.

To integrate RoutableIOS into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'RoutableIOS', '~> 0.0.5'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate RoutableIOS into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "RoutableIOS/RoutableIOS" ~> 0.0.5
```
### Swift Package Manager

To use RoutableIOS as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
import PackageDescription

let package = Package(
    name: "HelloRoutableIOS",
    dependencies: [
        .Package(url: "https://github.com/seductive-mobile/RoutableIOS.git", "0.0.5")
    ]
)
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate RoutableIOS into your project manually.

#### Git Submodules

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add RoutableIOS as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/seductive-mobile/RoutableIOS.git
$ git submodule update --init --recursive
```

- Open the new `RoutableIOS` folder, and drag the `RoutableIOS.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `RoutableIOS.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `RoutableIOS.xcodeproj` folders each with two different versions of the `RoutableIOS.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `RoutableIOS.framework`.

- And that's it!

> The `RoutableIOS.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

#### Embeded Binaries

- Download the latest release from https://github.com/seductive-mobile/RoutableIOS/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `RoutableIOS.framework`.
- And that's it!

## Usage

For example you have 3 tabs in YourTabBarViewController:

```bash
var feedNavigator: UINavigationController = UINavigationController()
var dialogNavigator: UINavigationController = UINavigationController()
var settingsNavigator: UINavigationController = UINavigationController()
```

1) You need to conform protocol TabRouterProtocol from RoutableIOS, for example in YourTabBarViewController instance.

```bash
protocol TabRouterProtocol {
// calls when applications want to tell you: «I want to switch to tab with navigator».
    func setActive(navigator: UINavigationController)

// There are your: «Feed», «Dialogs», «Settings» and etc.
    var allNavigators: [UINavigationController] { get }
}
```

Implementation:

```bash
func setActive(navigator: UINavigationController) {
	self.selectedViewController = navigator
}

var allNavigators = [feedNavigator, dialogNavigator, settingsNavigator]
```

2) You must register event names which can open them.
For example, dialogs navigation controller can open dialogs and chats.

So, lets register it.

```bash
dialogNavigator.registerNavigation(for: "openDialog")
dialogNavigator.registerNavigation(for: "openChat")

settingsNavigator.registerNavigation(for: "openSettings")
settingsNavigator.registerNavigation(for: "openSpecificSetting")
```

So, that is it!

Now, if you want to open a chat with any user, you have to:

```bash
import RoutableIOS
…
var tabBar: YourTabBarViewController = …
var someUser: User = …
…
let vc = UIChatViewController(with: someUser)
let navigationContent = NavigationContent.setAfterRoot(vcs: [vc], animated: false)
tabBar.show(content: navigationContent, identifier: "openChat")
```

As you can see, after calling tabBar.show(…) application will switch tab to «Dialogs» and set UIChatViewController after rootViewController.

There are all NavigationContent types:

```bash
public enum NavigationContent {
    // add to current stack vcs
    case push(vcs: [UIViewController], animated: Bool)

    // show modally vc
    case modal(vc: UIViewController, animated: Bool, completion: RoutableIOS.CompletionPresenting?)

    // replace last vc with our view controllers
    case replaceLast(vcs: [UIViewController], animated: Bool)

    // set our vcs as root
    case setAsRoot(vcs: [UIViewController], animated: Bool)

    // set vcs straight after rootViewController
    case setAfterRoot(vcs: [UIViewController], animated: Bool)

    // set our vcs straight after vc
    case setAfter(vc: UIViewController, vcs: [UIViewController], animated: Bool)

    // pop to specific vc
    case pop(to: UIViewController, animated: Bool)

    // pop with specific predicate
    case popWith(predicate: RoutableIOS.DestinationPredicat, animated: Bool, notFoundHandler: RoutableIOS.NotFoundDestination)
}
```

Can I use NavigationContent to move through current UINavigationController stack?
YES!

```bash
class SomeVC: UIViewController {
	 func moveToChats(withUser user: User) {
		let vc = UIChatViewController(with: user)
		let navigationContent = NavigationContent.push(vcs: [vc], animated: false)
		navigationController?.show(content: navigationContent, identifier: "openChat")
	 }
}
```

After this article I invite you to play with the playground I’ve prepared for you in pod repo. Keep in touch and feel free to make pull requests!

## License

RoutableIOS is released under the MIT license. See [LICENSE](https://github.com/seductive-mobile/RoutableIOS/blob/master/LICENSE) for details.
