//
//  PlaylistHeaderCell.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 17/02/2025.
//

import SwiftUI

struct PlaylistHeaderCell: View {
    var title: String = "Some Playlist Title Goes Here"
    var subtitle: String = "Subtitle goes here"
    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(height: 300)
          
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
