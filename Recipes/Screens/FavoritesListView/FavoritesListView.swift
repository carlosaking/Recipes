//
//  FavoritesListView.swift
//  Recipes
//
//  Created by Carlos on 7/19/24.
//

import SwiftUI

struct FavoritesListView: View {
    @State private var favorites: [Meal] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if favorites.isEmpty {
                    NoFavorites()
                        .padding(.top, 100)
                } else {
                    ForEach(favorites) { meal in
                        NavigationLink(value: meal) {
                            RecipeCell(meal: meal)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .background(.appBackground)
            .scrollIndicators(.hidden)
            .navigationTitle("Favorites")
            .navigationDestination(for: Meal.self) { meal in
                DetailView(meal: meal)
            }
            .task {
                do {
                    favorites = try await PersitenceManager.retrieveFavorites()
                    favorites = favorites.sorted { $0.name ?? "" < $1.name ?? "" }
                } catch RAppError.invalidData {
                    // This is to keep it simple. It will just print that an error occured
                    print("An error occured")
                } catch {
                    // This is to keep it simple. It will just print that an error occured
                    print("An error occured")
                }
            }
            
        }
    }
}

#Preview {
    FavoritesListView()
}
