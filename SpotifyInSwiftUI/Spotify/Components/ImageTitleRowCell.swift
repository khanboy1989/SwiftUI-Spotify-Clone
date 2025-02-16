//
//  ImageTitleRowCell.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 16/02/2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some Item Name"
    
    var body: some View {
        VStack(alignment: .leading ,spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
            
        }.frame(width: imageSize)
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
