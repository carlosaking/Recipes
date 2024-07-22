//
//  NoFavorites.swift
//  Recipes
//
//  Created by Carlos on 7/21/24.
//

import SwiftUI

struct NoFavorites: View {
    var body: some View {
        ContentUnavailableView(label: {
                    VStack {
                        Image(systemName: SFSymbols.heart)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.secondary)
                        
                        Text("No Favorites")
                            .font(.system(size: 20 , weight: .bold))
                            .padding(.vertical, 5)
                    }
                }, description: {
                    Text("Your favorites list is empty. Start adding your favorite recipes!")
                        .font(.system(size: 17))
                })
    }
}

#Preview {
    NoFavorites()
}
