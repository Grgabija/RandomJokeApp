//
//  String+Helpers.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-21.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: " ")
    }
}
