# Photo Flickr Viewer App

This app allows users to browse and view photos fetched from the Flickr public API. It follows the MVVM (Model-View-ViewModel) architecture pattern and utilizes various SwiftUI components for the user interface.

## MVVM Architecture

The MVVM architecture pattern is used to separate concerns within the app:

- **Model**: Represents the data and business logic of the app. In this project, the `Photo` model represents each photo object fetched from the API. It contains properties such as `title`, `link`, `tags`, `description`, `author`, and `published`. Additionally, computed properties are used in the `Photo` model for date formatting (`formattedPublishedDate`) and author information extraction (`authorUsername` and `authorEmail`).

- **View**: Represents the user interface elements of the app. SwiftUI views are used to create the UI components such as `PhotosListView`, `PhotoItemView`, and `PhotoDetailView`. These views are responsible for displaying the fetched photos and their details.

- **ViewModel**: Acts as an intermediary between the View and the Model. The `PhotosListViewModel` coordinates data flow between the `PhotosListView` and the underlying data model. It fetches photos from the network using the `SearchPhotosNetworkingService` and updates the UI accordingly. The ViewModel also ensures thread safety by updating the UI on the main thread.

## HTML View

One of the challenges in this project was handling HTML content retrieved from the API. The `description` property of each photo object contains HTML markup. To display this content properly, the app uses a custom `HTMLTextView` component, which parses and renders the HTML content using `NSAttributedString`. This allows the app to display rich text with proper formatting and links.

## Thread Safety

To ensure thread safety and prevent UI unresponsiveness, asynchronous operations such as network requests are performed on background threads. Upon receiving data from the network, the ViewModel updates the UI on the main thread using Grand Central Dispatch (GCD). This ensures that UI updates occur on the main thread, as required by SwiftUI.

## Computed Properties in Models

Computed properties are used in the `Photo` model to encapsulate data processing and formatting logic. For example, the `publishedAt` property computes the formatted date string from the `published` date string retrieved from the API. Similarly, the `authorUsername` and `authorEmail` properties extract the username and email information from the `author` string using regular expressions.

---

## DEMO

To see the app in action, check out the following demo GIF:

![Demo GIF](Flickr-iOS-Demo/Flickr.gif)
