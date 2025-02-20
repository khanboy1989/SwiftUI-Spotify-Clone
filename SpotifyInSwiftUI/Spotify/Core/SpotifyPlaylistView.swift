//
//  SpotifyPlaylistView.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 17/02/2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    @Environment(\.router) var router
    var product: Product = .mock
    var user: User = .mock
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.spotifyGray.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {

                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "",
                        imageName: product.thumbnail
                    ).readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageSize: 50,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: {
                                gotoPlaylistView(product: product)
                            },
                            onEllipsisPressed: {
                                
                            }
                        ).padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            header
            .frame(maxHeight: .infinity, alignment: .top)
        }.task {
             await fetchProducts()
        }.toolbar(.hidden, for: .navigationBar)
    }
    
    func fetchProducts() async {
        do {
            let helper = DatabaseHelper()
            products = try await helper.getProducts()
        } catch {
            print("error =\(error.localizedDescription)")
        }
    }
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }.padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }          .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showHeader)
    }
    
    private func gotoPlaylistView(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlaylistView()

    }
}
