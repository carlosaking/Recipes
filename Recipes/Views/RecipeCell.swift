//
//  RecipeCell.swift
//  Recipes
//
//  Created by Carlos on 7/20/24.
//

import SwiftUI

struct RecipeCell: View {
    let meal: Meal
    
    var body: some View {
        HStack(spacing: 15) {
            RAppImage(imageUrl: meal.imageUrl ?? "")
            
            NameAndHeart(meal: meal)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(.cellBackground)
    }
}

#Preview {
    RecipeCell(meal: MockData.meal)
}
