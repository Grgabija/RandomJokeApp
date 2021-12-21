//
//  UIViewController+Helpers.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-21.
//

import UIKit

extension UIViewController {
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
