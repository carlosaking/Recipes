//
//  RecipesListView.swift
//  Recipes
//
//  Created by Carlos on 7/19/24.
//

import SwiftUI

struct RecipesListView: View {
    @AppStorage("preferredColorScheme") private var preferredColorScheme: Theme = .systemDefault
    @Environment(\.colorScheme) private var deviceColorScheme
    @StateObject var viewModel = RecipesListViewModel()
    @State private var isDarkMode: Bool = false
    @State private var searchTerm: String = ""
    
    var filteredMeals: [Meal] {
        guard !searchTerm.isEmpty else { return viewModel.meals }
        return viewModel.meals.filter { $0.name!.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    if viewModel.hasError {
                        ErrorState(viewModel: viewModel)
                            .padding(.top, 100)
                    } else {
                        ForEach(filteredMeals) { meal in
                            NavigationLink(value: meal) {
                                RecipeCell(meal: meal)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .if(!viewModel.hasError) { view in
                    view.refreshable {
                        do {
                            try await viewModel.getMeals()
                        } catch RAppError.invalidURL {
                            viewModel.hasError = true
                        } catch RAppError.invalidResponse {
                            viewModel.hasError = true
                        } catch RAppError.invalidData {
                            viewModel.hasError = true
                        } catch {
                            viewModel.hasError = true
                        }
                    }
                }
                .background(.appBackground)
                .scrollIndicators(.hidden)
                .navigationTitle("Recipes")
                .preferredColorScheme(preferredColorScheme.colorScheme)
                .toolbar {
                    Image(systemName: isDarkMode ? SFSymbols.sun : SFSymbols.moon)
                        .onTapGesture {
                            isDarkMode.toggle()
                            preferredColorScheme = isDarkMode ? .dark : .light
                        }
                }
                .navigationDestination(for: Meal.self) { meal in
                    DetailView(meal: meal)
                }
                .onAppear() {
                    isDarkMode = deviceColorScheme == .dark
                }
                
                if viewModel.isLoading {
                    ProgressView().tint(.brandPrimary).controlSize(.large)
                }
            }
            .task {
                do {
                    try await viewModel.getMeals()
                } catch RAppError.invalidURL {
                    viewModel.hasError = true
                    viewModel.isLoading = false
                } catch RAppError.invalidResponse {
                    viewModel.hasError = true
                    viewModel.isLoading = false
                } catch RAppError.invalidData {
                    viewModel.hasError = true
                    viewModel.isLoading = false
                } catch {
                    viewModel.hasError = true
                    viewModel.isLoading = false
                }
            }
            .searchable(text: $searchTerm, prompt: "Search Recipes")
        }
    }
}

#Preview {
    RecipesListView()
}
