//
//  LocalePath.swift
//  Pods
//
//  Created by Nick Lee on 1/26/16.
//
//

import Foundation

@objc public final class LPath: NSObject {

    // MARK: Internal Properties

    fileprivate let components: [String]

    // MARK: Initialization

    internal init(components: [String]) {
        self.components = components
        super.init()
    }

    // MARK: Chaining

    public subscript(key: Any) -> LPath {
        var newComponents = components
        newComponents.append(String(describing: key))
        return LPath(components: newComponents)
    }
    
    // MARK: Evaluating

    public var stringValue: String? {
        return Locale.sharedInstance.traverse(components) as? String
    }

    public var dictionaryValue: [String : AnyObject]? {
        return Locale.sharedInstance.traverse(components) as? [String : AnyObject]
    }
    
    public var arrayValue: [AnyObject]? {
        return Locale.sharedInstance.traverse(components) as? [AnyObject]
    }
    
    // MARK: Printable

    public override var description: String {
        if let obj = Locale.sharedInstance.traverse(components) {
            return String(describing: obj)
        } else {
            return "nil"
        }
    }

}
