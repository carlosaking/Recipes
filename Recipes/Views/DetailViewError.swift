//
//  DetailViewError.swift
//  Recipes
//
//  Created by Carlos on 7/22/24.
//

import SwiftUI

struct DetailViewError: View {
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
            Text("This screen is having trouble loading. Please try again later.")
                .font(.system(size: 17))
        })
    }
}

#Preview {
    DetailViewError()
}
