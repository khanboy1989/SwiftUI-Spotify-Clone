//
//  Product.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 18/12/2024.
//

import Foundation

// MARK: - ProductArray
struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        return images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
            return Product(
                id: 123,
                title: "Example Product Title",
                description: "This is a mock product description.",
                category: "Electronic Devices",
                price: 999.99,
                discountPercentage: 15.0,
                rating: 4.5,
                stock: 50,
                tags: ["Tech", "Gadget", "Premium"],
                brand: "Apple",
                sku: "SKU-123456",
                weight: 1200,
                dimensions: Dimensions(width: 10.5, height: 5.0, depth: 1.2),
                warrantyInformation: "1 Year Warranty",
                shippingInformation: "Ships in 3-5 business days",
                availabilityStatus: .inStock,
                reviews: [
                    Review(rating: 5, comment: "Great product!", date: .the20240523T085621618Z, reviewerName: "John Doe", reviewerEmail: "john@example.com"),
                    Review(rating: 4, comment: "Good quality but expensive.", date: .the20240523T085621619Z, reviewerName: "Jane Doe", reviewerEmail: "jane@example.com")
                ],
                returnPolicy: .the30DaysReturnPolicy,
                minimumOrderQuantity: 1,
                meta: Meta(
                    createdAt: .the20240523T085621618Z,
                    updatedAt: .the20240523T085621619Z,
                    barcode: "1234567890123",
                    qrCode: "https://example.com/qr"
                ),
                images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
                thumbnail: Constants.randomImage
            )
        }
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}

extension ProductArray {
    static var mock: ProductArray {
        return ProductArray(
            products: [Product.mock, Product.mock],
            total: 2,
            skip: 0,
            limit: 10
        )
    }
}

extension ProductRow {
    static var mock: ProductRow {
        return ProductRow(
            title: "Featured Products",
            products: [Product.mock, Product.mock]
        )
    }
}
