# Spotify Clone - SwiftUI

This project is a SwiftUI-based clone of Spotify's home view and playlist view, inspired by [Nick Sarno's SwiftUI tutorials](https://www.youtube.com/@NickSarno). It fetches real products and user data from [DummyJSON API](https://dummyjson.com) to enhance the UI with dynamic content.

## Features
- **Spotify-style UI** for browsing products and categories.
- **Asynchronous API calls** to fetch products and users.
- **Dynamic product display** in a Spotify-inspired grid layout.
- **Navigation and details view** similar to Spotify playlists.

## Screenshots

| Home View | Playlist View |
|-----------|--------------|
| ![Home](https://github.com/user-attachments/assets/e84155f6-af4b-47be-ae8f-a39730308638) | ![Playlist](https://github.com/user-attachments/assets/f1b68dee-578c-4cf5-accc-c53c4eb902f3) |

| Products List | Categories View |
|--------------|----------------|
| ![Products](https://github.com/user-attachments/assets/c19b4da0-acaf-4ca7-b93c-97ac56c4c9fc) | ![Categories](https://github.com/user-attachments/assets/76efcdbe-6050-45e6-ba02-51f180c353a5) |

## Package Dependencies

The following dependencies are used in this project:

- **SDWebImage** - 5.20.0
- **SDWebImageSwiftUI** - 3.1.3
- **SwiftfulRecursiveUI** - 1.0.2
- **SwiftfulRouting** - 5.3.6
- **SwiftfulUI** - 1.2.0

## API Integration
The app fetches product and user data from DummyJSON API:

```swift
struct DatabaseHelper {
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }
}
```

## Technologies Used
- **SwiftUI** for UI development
- **Async/Await** for handling API calls
- **URLSession** for networking
- **JSON Decoding** for parsing API responses

## Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/khanboy1989/SwiftUI-Spotify-Clone.git
   ```
2. Open the project in Xcode.
3. Run the app on a simulator or device.

## Tutorial Reference
This project is inspired by Nick Sarno’s SwiftUI course. You can follow the tutorial series here:
[SwiftUI Spotify Clone Tutorial - Nick Sarno](https://www.youtube.com/watch?v=9Qww1VNLHzA&list=PLwvDm4VfkdpiT7mKzjxfCYn_zaMC3Fmkz&index=1)

## Future Improvements
- Enhance UI with animations.
- Implement user authentication.
- Improve performance with caching.

## Credits
- Inspired by [Nick Sarno's SwiftUI tutorials](https://www.youtube.com/@NickSarno)
- API Data: [DummyJSON](https://dummyjson.com)

## License
This project is open-source and available under the MIT License.
