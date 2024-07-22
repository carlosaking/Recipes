//
//  RAppImage.swift
//  Recipes
//
//  Created by Carlos on 7/20/24.
//

import SwiftUI

struct RAppImage: View {
    let imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Color(.systemGray5)
        }
        .frame(width: 70, height: 70)
        .cornerRadius(10)
    }
}

#Preview {
    RAppImage(imageUrl: MockData.meal.imageUrl ?? "")
}
