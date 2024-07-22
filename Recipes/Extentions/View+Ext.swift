//
//  View+Ext.swift
//  Recipes
//
//  Created by Carlos on 7/21/24.
//

import SwiftUI


extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
