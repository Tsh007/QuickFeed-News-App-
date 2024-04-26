# QuickFeed News App - SwiftUI

Welcome to **NewsApp**! This app fetches the latest news from around the world and allows users to bookmark their favorite articles for later reading. Built with SwiftUI, the app follows the MVVM (Model-View-ViewModel) architecture and uses the News API to fetch news data. Bookmarking functionality is implemented using property list (Plist) files.

## Features

- **Latest News**: Fetches the latest news articles from various sources.
- **Article Details**: Tap on an article to read more about it.
- **Bookmarking**: Bookmark your favorite articles for easy access.
- **Simple UI**: Clean and intuitive user interface using SwiftUI.
- **MVVM Architecture**: Implementation of MVVM pattern for better separation of concerns and code organization.

## Getting Started

### Prerequisites

- Xcode 12 or later
- Swift 5 or later
- An API key from [News API](https://newsapi.org/)

### Setup

1. **Clone the repository**: 
   ```bash
   git clone https://github.com/your-repo-url/NewsApp.git](https://github.com/Tsh007/QuickFeed-News-App-.git
   ```

2. **Open in Xcode**: 
   Open the project in Xcode by double-clicking the `QuickFeed.xcodeproj` file.

3. **Add your News API key**:
   - Open the `Keys.swift` file.
   - Add a new key named `NewsAPIKey` with your News API key as the value.

4. **Build and run**:
   - Select your target device or simulator in Xcode.
   - Click the "Run" button to build and run the app.

## Architecture Overview

- **Model**: Defines the data structures used in the app, such as `Article`.
- **ViewModel**: Handles fetching news from the News API and managing bookmarks. This layer also contains business logic and interacts with the Model.
- **View**: Represents the SwiftUI views that display the user interface.

### Bookmarks

To bookmark an article, simply tap the "Bookmark" button in the article's details screen. The bookmark data is stored in a Plist file in the app's documents directory, ensuring that bookmarks persist even if the app is closed or restarted.

### Project Structure

- **Views**: Contains all SwiftUI views for the app.
- **ViewModels**: Contains the ViewModel(s) responsible for handling business logic and data.
- **Models**: Contains the data structures used in the app.
- **Resources**: Contains assets and Plist files used by the app.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request describing your changes.

## Contact

If you have any questions or suggestions, feel free to reach out through the repository's issue tracker or contact me at [22cd3032@rgipt.ac.in].

## ScreenShots
<img src="https://github.com/Tsh007/QuickFeed-News-App-/assets/77430570/34e7cc9d-2721-4796-8fe3-e448cb54e9e5" width="400">
</br></br>
<img src="https://github.com/Tsh007/QuickFeed-News-App-/assets/77430570/e815a73a-6bb6-45fa-ae9d-59cc9598dd93" width="400">
