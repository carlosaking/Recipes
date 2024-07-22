//
//  NameAndHeart.swift
//  Recipes
//
//  Created by Carlos on 7/20/24.
//

import SwiftUI

struct NameAndHeart: View {
    let meal: Meal
    @State private var isFavorite: Bool = false
    
    var body: some View {
        HStack {
            RAppText(title: meal.name ?? "")
            
            Spacer()
            
            Image(systemName: isFavorite ? SFSymbols.heartFill : SFSymbols.heart)
                .foregroundColor(isFavorite ? .red : .primary)
                .onTapGesture {
                    isFavorite.toggle()
                    Task {
                        do {
                            try await PersitenceManager.updateWith(favorite: meal, actionType: .add)
                            UserDefaults.standard.set(true, forKey: meal.name ?? "")
                        } catch RAppError.alreadyInFavorites {
                            try await PersitenceManager.updateWith(favorite: meal, actionType: .remove)
                            UserDefaults.standard.removeObject(forKey: meal.name ?? "")
                        } catch {
                            // This is to keep it simple. It will just print that an error occured
                            print("An error occured")
                        }
                    }
                }
        }.onAppear {
            isFavorite = UserDefaults.standard.bool(forKey: meal.name ?? "")
        }
    }
}

#Preview {
    NameAndHeart(meal: MockData.meal)
}
