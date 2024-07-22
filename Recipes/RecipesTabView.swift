//
//  RecipesTabView.swift
//  Recipes
//
//  Created by Carlos on 7/19/24.
//

import SwiftUI

struct RecipesTabView: View {
    @AppStorage("preferredColorScheme") private var preferredColorScheme: Theme = .systemDefault
    
    var body: some View {
        TabView {
            RecipesListView()
                .tabItem {
                    Image(systemName: SFSymbols.listBullet)
            }
            
            FavoritesListView()
                .tabItem {
                    Image(systemName: SFSymbols.heart)
            }

        }
        .accentColor(.brandPrimary)
        .preferredColorScheme(preferredColorScheme.colorScheme)
    }
}

#Preview {
    RecipesTabView()
}
