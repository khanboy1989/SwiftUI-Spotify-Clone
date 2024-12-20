//
//  ContentView.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 18/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    @State private var products: [Product] = []
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(products) { product in
                        Text(product.title)
                            .foregroundStyle(.spotifyGreen)
                    }
                }
            }
        }
        .padding()
        .task {
            await fetchData()
        }
    }
    
    private func fetchData() async{
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
