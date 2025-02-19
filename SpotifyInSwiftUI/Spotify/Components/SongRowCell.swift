//
//  SongRowCell.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 19/02/2025.
//

import SwiftUI

struct SongRowCell: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some Song Name Goes Here"
    var subtitle: String? = "Some artist name"
    
    var onCellTapped: (() -> Void)? = nil
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.red)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()

        }

    }
}
