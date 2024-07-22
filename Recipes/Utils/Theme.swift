//
//  Theme.swift
//  Recipes
//
//  Created by Carlos on 7/21/24.
//

import SwiftUI

enum Theme: Int {
    case systemDefault, light, dark
    
    var colorScheme: ColorScheme? {
        switch self {
        case .systemDefault:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
