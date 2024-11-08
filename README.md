# Spotify Clone 🎵🎧

A Spotify clone built with Flutter, leveraging PocketBase as the backend. This app allows users to explore, manage, and play songs with seamless state management, persistent session storage, and theme mode switching.

---

![Flutter](https://img.shields.io/badge/Flutter-3.26.0-blue?logo=flutter)
![PocketBase](https://img.shields.io/badge/PocketBase-0.13.0-orange?logo=server)
![Dart](https://img.shields.io/badge/Dart-2.19-blue?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

---

## ✨ Features

- 🎧 **Music Streaming** powered by `just_audio`.
- 🔄 **State Management** using `flutter_bloc` for reactive UI updates.
- 🌗 **Light/Dark Mode** persistence with `hydrated_bloc`.
- 🔐 **Local Storage** using `Hive` to save user session and data.
- 🖥️ **Backend** powered by PocketBase (local server).
  
---

## ⚙️ Getting Started

### Prerequisites

Before starting, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.26.0 or above)
- [PocketBase](https://pocketbase.io/docs/) (local backend server)
- Git

---

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/spotify-clone.git
    cd spotify-clone
    ```

2. **Install Flutter dependencies**:

    ```bash
    flutter pub get
    ```

3. **Set up PocketBase**:

    - Download and install [PocketBase](https://pocketbase.io/docs/).
    
    - Start the PocketBase server on your local machine:

      ```bash
      ./pocketbase serve
      ```

    - **Import the PocketBase schema**:
    
      In the PocketBase admin dashboard (accessible via `http://localhost:8090/_/`), import the schema from the `spotiffy_clone_schema.json` file included in this repository:
    
      1. Go to **Settings** > **Import Collections**.
      2. Upload the `spotiffy_clone_schema.json` file.

4. **Add sample songs to PocketBase**:

    - After importing the schema, go to the **Songs** collection in the admin dashboard.
    - Add a few random songs with the necessary fields (title, artist, album, etc.).

---

### Configure Environment Variables

1. **Create a `.env` file**:

    In the root of the project, create a `.env` file if it doesn't already exist.

2. **Add the following variables to the `.env` file**:

    ```env
    LOCAL_HOST=your_local_host_without_quotes
    SONG_COLLECTION_ID=your_song_collection_id_without_quotes
    ```

    - Replace `your_local_host_without_quotes` with your PocketBase server's base URL (e.g., `http://localhost:8090`).
    - Replace `your_song_collection_id_without_quotes` with the **collection ID** of the "Songs" collection in your PocketBase admin dashboard.

3. **Ensure `.env` is excluded from version control**:

    The `.env` file should already be ignored by `.gitignore`, but double-check to ensure sensitive information is not committed.

4. **Load the `.env` file in the app**:

    The app is pre-configured to use the `flutter_dotenv` package. The variables from the `.env` file will be automatically loaded when the app starts.

---

## 🚀 Running the App

1. **Run the Flutter app on your device**:

    ```bash
    flutter run
    ```

    Ensure your PocketBase server is running and accessible at the URL specified in the `.env` file.

---

## 📱 Screenshots

![App Preview Banner](assets/banner/app_banner.png)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check out the [issues page](https://github.com/andrrew24/spotify-clone/issues).

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
