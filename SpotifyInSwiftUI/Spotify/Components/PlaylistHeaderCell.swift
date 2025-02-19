//
//  PlaylistHeaderCell.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 17/02/2025.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    var height: CGFloat = 300
    var title: String = "Some Playlist Title Goes Here"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    var body: some View {
        Rectangle()
            .opacity(0.0)
            .overlay(
                ImageLoaderView(urlString: imageName)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(
                            colors: [
                                shadowColor.opacity(0),
                                shadowColor
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                ,
                alignment: .bottomLeading)
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }.ignoresSafeArea()
    }
    
}
