//
//  ErrorState.swift
//  Recipes
//
//  Created by Carlos on 7/21/24.
//

import SwiftUI

struct ErrorState: View {
    var viewModel: RecipesListViewModel
    
    var body: some View {
            ContentUnavailableView(label: {
                VStack {
                    Image(systemName: SFSymbols.exclamationmark)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.secondary)
                    
                    Text("Oops!")
                        .font(.system(size: 20 , weight: .bold))
                        .padding(.vertical, 5)
                    }
            }, description: {
                Text("This screen is having trouble loading. Please check your connection and try again.")
                    .font(.system(size: 17))
            },  actions: {
                Button(action: {
                    viewModel.hasError = false
                    viewModel.isLoading = true
                    viewModel.initialGetMeals()
                }) {
                    Text("Try Again")
                        .foregroundColor(.white)
                        .frame(width: 110, height: 40)
                        .background(.brandPrimary)
                        .cornerRadius(10)
                        

                }
            })
    }
}
