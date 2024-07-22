//
//  RecipesListViewModel.swift
//  Recipes
//
//  Created by Carlos on 7/19/24.
//

import Foundation
import Observation

// This can be its own file but I kept it here to keep it simple
enum RAppError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToFavorite
    case alreadyInFavorites
}

final class RecipesListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading = true
    @Published var hasError = false
    
    func initialGetMeals() {
        Task {
            do {
                try await getMeals()
            } catch RAppError.invalidURL {
                hasError = true
                isLoading = false
            } catch RAppError.invalidResponse {
                hasError = true
                isLoading = false
            } catch RAppError.invalidData {
                hasError = true
                isLoading = false
            } catch {
                hasError = true
                isLoading = false
            }
        }
    }
    
    func getMeals() async throws {
        let endpoint = "\(BASE_URL)filter.php?c=Dessert"
        guard let url = URL(string: endpoint) else { throw RAppError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw RAppError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()            
            let decodedResponse = try decoder.decode(Meals.self, from: data)
            let filteredMeals = decodedResponse.meals.filter { meal in
                return meal.id != nil && meal.name != nil && meal.imageUrl != nil && !meal.id!.isEmpty && !meal.name!.isEmpty && !meal.imageUrl!.isEmpty
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.meals = filteredMeals.sorted { $0.name ?? "" < $1.name ?? "" }
            }
        } catch {
            throw RAppError.invalidData
        }
    }
}
