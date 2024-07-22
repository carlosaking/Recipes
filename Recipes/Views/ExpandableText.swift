//
//  ExpandableText.swift
//  Recipes
//
//  Created by Carlos on 7/20/24.
//

import SwiftUI

struct ExpandableText: View {
    let text: String
    
    @State var isCollapsed = true
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(text)
                .foregroundColor(.primary)
                .padding(.bottom, 3)
                .frame(maxHeight: isCollapsed ? 200 : .infinity, alignment: .leading)
            
            HStack {
                Spacer()
                
                Button {
                    isCollapsed = !isCollapsed
                } label: {
                    let title = isCollapsed ? "View more" : "View less"
                    
                    Text(title)
                        .font(.callout)
                        .foregroundColor(.brandPrimary)
                        .multilineTextAlignment(.leading)
                }
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    ExpandableText(text: MockData.instructions)
}
