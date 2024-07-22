//
//  PersitenceManager.swift
//  Recipes
//
//  Created by Carlos on 7/21/24.
//

import Foundation


enum PersistenceActionType {
    case add, remove
}

enum PersitenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func retrieveFavorites() async throws -> [Meal] {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Meal].self, from: favoritesData)
            return favorites
        } catch {
            throw RAppError.invalidData
        }
    }
    
    static func save(favorites: [Meal]) async throws {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
        } catch {
            throw RAppError.unableToFavorite
        }
    }
    
    static func updateWith(favorite: Meal, actionType: PersistenceActionType) async throws {
        var retrievedFavorites = try await retrieveFavorites()
        
        switch actionType {
        case .add:
            guard !retrievedFavorites.contains(favorite) else {
                throw RAppError.alreadyInFavorites
            }
            
            retrievedFavorites.append(favorite)
            
        case .remove:
            retrievedFavorites.removeAll { $0.name == favorite.name }
        }
        
        try await save(favorites: retrievedFavorites)
    }
}
