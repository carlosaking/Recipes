//
//  RAppText.swift
//  Recipes
//
//  Created by Carlos on 7/20/24.
//

import SwiftUI

struct RAppText: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.primary)
            .minimumScaleFactor(0.5)
    }
}

#Preview {
    RAppText(title: "Ingredients")
}
