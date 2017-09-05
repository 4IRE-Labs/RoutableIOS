//
//  Navigator.swift
//  ManyWaysIOS
//
//  Created by Malkevych Bohdan on 18.08.17.
//  Copyright © 2017 Seductive-mobile. All rights reserved.
//

import UIKit

public typealias CompletionPresenting = () -> Void
public typealias FoundDestination = (_ found: Bool) -> Void
public typealias DestinationPredicat = (UIViewController) -> Bool

public enum NavigationContent {
    case push(vcs: [UIViewController], animated: Bool)
    case modal(vc: UIViewController, animated: Bool, completion: CompletionPresenting?)
    case replaceLast(vcs: [UIViewController], animated: Bool)
    case setAsRoot(vcs: [UIViewController], animated: Bool)
    case setAfterRoot(vcs: [UIViewController], animated: Bool)
    case setAfter(vc: UIViewController, vcs: [UIViewController], animated: Bool)
    case pop(to: UIViewController, animated: Bool)
    case popWith(predicate: DestinationPredicat, animated: Bool, foundHandler: FoundDestination)
    
    public func defaultIdentifier() -> String {
        switch self {
        case .push(let vcs, _):
            return defaultIdentifier(for: vcs)
        case .modal(let vc, _, _):
            return vc.navigationIdentifier
        case .replaceLast(let vcs, _):
            return defaultIdentifier(for: vcs)
        case .setAsRoot(let vcs, _):
            return defaultIdentifier(for: vcs)
        case .setAfterRoot(let vcs, _):
            return defaultIdentifier(for: vcs)
        case .setAfter(_, let vcs, _):
            return defaultIdentifier(for: vcs)
        case .pop(to: let vc, _):
            return vc.navigationIdentifier
        case .popWith:
            fatalError("No default identifier for popWith predicate")
        }
    }
    
    private func defaultIdentifier(for vcs: [UIViewController]) -> String {
        return vcs.reduce("", { (res, vc) -> String in
            res + vc.navigationIdentifier
        })
    }
}

public protocol Navigatable {
    func show(content: NavigationContent)
    func canShowScreen(with identifier: String) -> Bool
}

extension UINavigationController: Navigatable, PropertyStoring {
    typealias T = [String: Bool]
    
    private struct CustomProperties {
        static var toggleState = Dictionary<String, Bool>()
    }
    
    var registeredNavIdentifiers: T {
        get {
            return getAssociatedObject(&CustomProperties.toggleState, defaultValue: CustomProperties.toggleState)
        }
        set {
            objc_setAssociatedObject(self, &CustomProperties.toggleState, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    public func show(content: NavigationContent) {
        switch content {
        case .push(let vcs, let animated):
            push(vcs: vcs, animated: animated)
        case .modal(let vc, let animated, let completion):
            modal(vc: vc, animated: animated, completion: completion)
        case .replaceLast(let vcs, let animated):
            replaceLast(vcs: vcs, animated: animated)
        case .setAsRoot(let vcs, let animated):
            setAsRoot(vcs: vcs, animated: animated)
        case .setAfterRoot(let vcs, let animated):
            setAfterRoot(vcs: vcs, animated: animated)
        case .setAfter(let vc, let vcs, let animated):
            setAfter(vc: vc, vcs: vcs, animated: animated)
        case .pop(to: let vc, let animated):
            pop(to: vc, animated: animated)
        case .popWith(let predicate, let animated, let foundHandler):
            pop(with: predicate, animated: animated, foundDestinationHandler: foundHandler)
        }
    }
    
    private func push(vcs: [UIViewController], animated: Bool) {
        let viewControllers = self.viewControllers + vcs
        setViewControllers(viewControllers, animated: animated)
    }
    
    private func modal(vc: UIViewController, animated: Bool,
                       completion: CompletionPresenting?) {
        let topViewController = self.topViewController
        topViewController?.present(vc, animated: animated, completion: completion)
        setViewControllers(viewControllers, animated: animated)
    }
    
    private func replaceLast(vcs: [UIViewController], animated: Bool) {
        var copyViewControllers = self.viewControllers
        let _ = copyViewControllers.popLast()
        let viewControllers = copyViewControllers + self.viewControllers
        setViewControllers(viewControllers, animated: animated)
    }
    
    private func setAsRoot(vcs: [UIViewController], animated: Bool) {
        setViewControllers(vcs, animated: animated)
    }
    
    private func setAfterRoot(vcs: [UIViewController], animated: Bool) {
        if let root = self.viewControllers.first {
            setViewControllers([root] + vcs, animated: animated)
        } else {
            setViewControllers(vcs, animated: animated)
        }
    }
    
    private func setAfter(vc: UIViewController, vcs: [UIViewController], animated: Bool) {
        guard let index = viewControllers.index(of: vc) else {
            return
        }
        let newStack: [UIViewController] = viewControllers[0...index] + vcs
        setViewControllers(newStack, animated: animated)
    }
    
    private func pop(to vc: UIViewController, animated: Bool) {
        popToViewController(vc, animated: animated)
    }
    
    private func pop(with predicate: DestinationPredicat,
                     animated: Bool,
                     foundDestinationHandler: FoundDestination?) {
        if let vc = viewControllers.first(where: predicate) {
            foundDestinationHandler?(true)
            popToViewController(vc, animated: animated)
        } else {
            foundDestinationHandler?(false)
        }
    }
    
    public func canShowScreen(with identifier: String) -> Bool {
        return registeredNavIdentifiers[identifier] ?? false
    }
    
    public func registerNavigation(for identifier: String) {
        registeredNavIdentifiers[identifier] = true
    }
    
    public func unregisterNavigation(for identifier: String) {
        registeredNavIdentifiers[identifier] = nil
    }
}

public extension UIViewController {
    public static var navigationIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var navigationIdentifier: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}
