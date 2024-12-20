//
//  SpotifyHomeView.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 19/12/2024.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var products: [Product] = []
    @State private var currentUser: User? = nil
    @State private var selectedCategory: SpotifyCategory? = nil
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(pinnedViews:[.sectionHeaders]) {
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 200, height: 200)
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
    
    func fetchProducts() async throws {
        do {
            let helper = DatabaseHelper()
            products = try await helper.getProducts()
            currentUser = try await helper.getUsers().first
        } catch {
            print("error =\(error.localizedDescription)")
        }
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
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(.spotifyBlack)

    }
}

#Preview {
    SpotifyHomeView()
}
