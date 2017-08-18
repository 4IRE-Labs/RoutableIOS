//
//  Router.swift
//  ManyWaysIOS
//
//  Created by Malkevych Bohdan on 18.08.17.
//  Copyright © 2017 Seductive-mobile. All rights reserved.
//

import UIKit

public protocol TabRouterProtocol {
    func show(content: NavigationContent, identifier: String?)
    func setActive(navigator: UINavigationController)
    var allNavigators: [UINavigationController] { get }
}

enum NavigationError: Error {
    case noNavigatrosToPerformThis
    case moreThanOneNavigatorCanOpen(navigators: [UINavigationController])
    
    var localizedDescription: String {
        switch self {
        case .noNavigatrosToPerformThis:
            return "No navigators to perform his navigation"
        case .moreThanOneNavigatorCanOpen(let navigators):
            return "Found more than one (\(navigators.count)) navigators can perform this navigation, system doesn't know what to do"
        }
    }
}

public extension TabRouterProtocol {
    public func show(content: NavigationContent, identifier: String? = nil) {
        let navIdentifier = identifier ?? content.defaultIdentifier()
        do {
            let navigator = try findNavigatorCanOpen(content: content,
                                                     identifier: navIdentifier)
            navigator.show(content: content)
            setActive(navigator: navigator)
        } catch {
            let error = error as! NavigationError
            fatalError("Error durning navigation. Error: \(error.localizedDescription)")
        }
    }
    
    func findNavigatorCanOpen(content: NavigationContent,
                              identifier: String) throws -> UINavigationController {
        let foundNavigators = allNavigators.filter{$0.canShowScreen(with: identifier)}
        switch foundNavigators.count {
        case 0:
            throw NavigationError.noNavigatrosToPerformThis
        case let x where x > 1:
            throw NavigationError.moreThanOneNavigatorCanOpen(navigators: foundNavigators)
        default: ()
        }
        return foundNavigators[0]
    }
}
