//
//  SpotifyHomeView.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 19/12/2024.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    @State private var currentUser: User? = nil
    @State private var selectedCategory: SpotifyCategory? = nil
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(pinnedViews:[.sectionHeaders]) {
                    Section {
                        VStack(spacing: 16) {
                            recentsSection
                                .padding(.horizontal, 16)
                            if let product = products.first {
                                newReleaseFunction(product: product)
                                    .padding(.horizontal, 16)
                            }
                            listRows
                        }
                    } header:  {
                        header
                    }
                }.padding(.top, 8)
                
            }.scrollIndicators(.hidden)
            .clipped()
        }.task {
            try? await fetchProducts()
        }.toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .scaledToFill()
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(SpotifyCategory.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }.padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(.spotifyBlack)
    }
    
    // Recents Section
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: self.products) { product in
            
            if let product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                ).asButton(.press) {
                    
                }
            }
        }
    }
    
    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top ,spacing: 16) {
                        ForEach(row.products) { product in
                            ImageTitleRowCell(
                                imageName: product.firstImage,
                                title: product.title
                            ).asButton(.press) {
                                
                            }
                        }
                    }.padding(.horizontal, 16)

                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private func newReleaseFunction(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headLine: product.brand,
            subHeadLine: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: {
                
            },
            onPlayPreseed: {
                
            }
        )
    }
    func fetchProducts() async throws {
        do {
            let helper = DatabaseHelper()
            products = try await Array(helper.getProducts().prefix(8))
            currentUser = try await helper.getUsers().first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.compactMap({ $0.brand }))
            
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
            
        } catch {
            print("error =\(error.localizedDescription)")
        }
    }
}

#Preview {
    SpotifyHomeView()
}
