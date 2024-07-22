//
//  DetailView.swift
//  Recipes
//
//  Created by Carlos on 7/20/24.
//

import SwiftUI

struct DetailView: View {
    let meal: Meal
    @StateObject var viewModel = DetailViewModel()
    
    var body: some View {
        ZStack {
            if !viewModel.isLoading {
                ScrollView {
                    if viewModel.hasError {
                        DetailViewError()
                            .padding(.top, 100)
                    } else {
                        VStack(alignment: .leading, spacing: 15) {
                            
                            AsyncImage(url: URL(string: meal.imageUrl ?? "")) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color(.systemGray5)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .cornerRadius(10)
                            
                            NameAndHeart(meal: meal)
                            
                            Divider()
                            
                            RAppText(title: "Instructions")
                            
                            ExpandableText(text: viewModel.recipeDetail?.instructions ?? "")
                            
                            Divider()
                            
                            HStack {
                                RAppText(title: "Ingredients")
                                
                                Spacer()
                                
                                RAppText(title: "Measurements")
                            }
                            
                            ForEach(viewModel.recipeDetail?.ingredients ?? [], id: \.self) { ingredient in
                                HStack {
                                    Text(ingredient.name.capitalized)
                                        .fontWeight(.medium)
                                        .foregroundColor(.primary)
                                        .minimumScaleFactor(0.5)
                                    
                                    Spacer()
                                    
                                    Text(ingredient.measure)
                                        .fontWeight(.medium)
                                        .foregroundColor(.brandPrimary)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                            
                            Spacer()
                            
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 10)
                    }
                }
                .background(.appBackground)
                .scrollIndicators(.hidden)
                .navigationTitle("Recipe")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden, for: .tabBar)
            }
            
            
            if viewModel.isLoading {
                ProgressView().tint(.brandPrimary).controlSize(.large)
            }
        }
        .task {
            do {
                try await viewModel.getRecipeFor(meal)
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
    }
}
    
#Preview {
    DetailView(meal: MockData.meal)
}
