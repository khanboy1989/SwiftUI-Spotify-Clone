//
//  User.swift
//  SpotifyInSwiftUI
//
//  Created by Serhan Khan on 18/12/2024.
//

import Foundation

// MARK: - UserArray
struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let hair: Hair
    let ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: Company
    let ein, ssn, userAgent: String
    let crypto: Crypto
    let role: Role
}

// MARK: - Address
struct Address: Codable {
    let address, city, state, stateCode: String
    let postalCode: String
    let coordinates: Coordinates
    let country: Country
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lng: Double
}

enum Country: String, Codable {
    case unitedStates = "United States"
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}

// MARK: - Company
struct Company: Codable {
    let department, name, title: String
    let address: Address
}

// MARK: - Crypto
struct Crypto: Codable {
    let coin: Coin
    let wallet: Wallet
    let network: Network
}

enum Coin: String, Codable {
    case bitcoin = "Bitcoin"
}

enum Network: String, Codable {
    case ethereumERC20 = "Ethereum (ERC20)"
}

enum Wallet: String, Codable {
    case the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A = "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - Hair
struct Hair: Codable {
    let color: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case curly = "Curly"
    case kinky = "Kinky"
    case straight = "Straight"
    case wavy = "Wavy"
}

enum Role: String, Codable {
    case admin = "admin"
    case moderator = "moderator"
    case user = "user"
}
