//
//  Storyboarded.swift
//  UI
//
//  Created by Jonathan Carvalho Mendes on 12/08/21.
//

import Foundation
import UIKit

public protocol Storyboarded {
    static func instantiate() -> Self
}
@available(iOS 13.0, *)
extension Storyboarded where Self: UIViewController{
    public static func instantiate() -> Self {
        let vcName = String(describing: self)
        let sbName = vcName.components(separatedBy: "ViewController")[0]
        let bundle = Bundle(for: Self.self)
        let sb = UIStoryboard(name: sbName, bundle: bundle)
        return sb.instantiateViewController(identifier: vcName) as! Self
    }
}
