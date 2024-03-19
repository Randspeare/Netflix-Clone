//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Ana Naomi Erlandez on 3/19/24.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
