//
//  Utils.swift
//  ManyWaysIOS
//
//  Created by Malkevych Bohdan on 18.08.17.
//  Copyright © 2017 Seductive-mobile. All rights reserved.
//

import UIKit
import ObjectiveC


protocol PropertyStoring {
    
    associatedtype T
    
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T
}

extension PropertyStoring {
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
}
