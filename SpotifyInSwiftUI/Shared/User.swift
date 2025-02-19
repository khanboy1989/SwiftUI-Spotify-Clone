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
    
    static var mock: User {
        return User(
            id: 1,
            firstName: "John",
            lastName: "Doe",
            maidenName: "Smith",
            age: 30,
            gender: .male,
            email: "johndoe@example.com",
            phone: "+1 234 567 890",
            username: "johndoe",
            password: "securepassword",
            birthDate: "1993-04-15",
            image: Constants.randomImage,
            bloodGroup: "O+",
            height: 180.0,
            weight: 75.5,
            eyeColor: "Brown",
            hair: Hair(color: "Black", type: .straight),
            ip: "192.168.1.1",
            address: Address(
                address: "123 Main St",
                city: "Los Angeles",
                state: "California",
                stateCode: "CA",
                postalCode: "90001",
                coordinates: Coordinates(lat: 34.0522, lng: -118.2437),
                country: .unitedStates
            ),
            macAddress: "00:1B:44:11:3A:B7",
            university: "MIT",
            bank: Bank(
                cardExpire: "12/26",
                cardNumber: "1234-5678-9012-3456",
                cardType: "Visa",
                currency: "USD",
                iban: "US123456789012345678901"
            ),
            company: Company(
                department: "Engineering",
                name: "Tech Corp",
                title: "Software Engineer",
                address: Address(
                    address: "456 Corporate Blvd",
                    city: "San Francisco",
                    state: "California",
                    stateCode: "CA",
                    postalCode: "94105",
                    coordinates: Coordinates(lat: 37.7749, lng: -122.4194),
                    country: .unitedStates
                )
            ),
            ein: "12-3456789",
            ssn: "123-45-6789",
            userAgent: "Mozilla/5.0",
            crypto: Crypto(
                coin: .bitcoin,
                wallet: .the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A,
                network: .ethereumERC20
            ),
            role: .user
        )
    }
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
