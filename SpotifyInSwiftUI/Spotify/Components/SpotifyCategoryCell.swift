//
//  SpotifyCategoryCell.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 19/12/2024.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "All"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

extension View {
    func themeColors(isSelected: Bool) -> some View{
        
        self
            .background(isSelected ? .spotifyGreen : .spotifyGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSelected: true)
            SpotifyCategoryCell(isSelected: true)
        }

    }
}
