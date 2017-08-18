//: Playground - noun: a place where people can play

import UIKit
import RoutableIOS


class TabRouter: TabRouterProtocol {
    var activeNavigator: UINavigationController
    
    let navigator1: UINavigationController
    let navigator2: UINavigationController
    let navigator3: UINavigationController
    
    init(nav1: UINavigationController, nav2: UINavigationController, nav3: UINavigationController) {
        navigator1 = nav1
        navigator2 = nav2
        navigator3 = nav3
        activeNavigator = nav1
    }
    
    lazy var allNavigators: [UINavigationController] = {
        return [self.navigator1, self.navigator2, self.navigator3]
    }()
    
    func setActive(navigator: UINavigationController) {
        print("Changed active navigator")
    }
}


let navigator1 = UINavigationController()
navigator1.registerNavigation(for: "test")

let navigator2 = UINavigationController()
//navigator2.registerNavigation(for: "test")

let navigator3 = UINavigationController()

navigator1.canShowScreen(with: "test")
navigator2.canShowScreen(with: "test")
navigator3.canShowScreen(with: "test")


let viewControllerToShow = UIViewController()

let pushNavContent = NavigationContent.push(vcs: [viewControllerToShow], animated: true)
let modalNavContent = NavigationContent.modal(vc: viewControllerToShow, animated: true, completion: nil)
let replaceLastNavContent = NavigationContent.replaceLast(vcs: [viewControllerToShow], animated: true)
let setAsRootNavContent = NavigationContent.setAsRoot(vcs: [viewControllerToShow], animated: true)
let setAfterRootNavContent = NavigationContent.setAfterRoot(vcs: [viewControllerToShow], animated: true)


let tabRouter = TabRouter(nav1: navigator1, nav2: navigator2, nav3: navigator3)

tabRouter.show(content: pushNavContent, identifier: "test")


// Show explicitly to show some screens
//navigator3.show(content: pushNavContent)
//navigator3.show(content: modalNavContent)
//navigator3.show(content: replaceLastNavContent)
//navigator3.show(content: setAsRootNavContent)
//navigator3.show(content: setAfterRootNavContent)


//default defaultIdentifiers
UINavigationController.navigationIdentifier
UINavigationController().navigationIdentifier

