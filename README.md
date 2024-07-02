# weather_app

*Description
This Flutter application fetches weather data using the OpenWeather API and displays it for various cities. Users can search for specific cities to get detailed weather information.

*Features

Display weather information for multiple cities.
Search functionality to find weather details for any city.
Error handling for API requests.

*Prerequisites
Flutter SDK installed
Android/iOS development environment set up
*Setup
*Clone the repository:

*Install dependencies:


*flutter pub get

API Key Setup:
*Sign up for an API key at OpenWeather API.
Replace 'YOUR_API_KEY' in lib/service.dart with your actual API key.

*Run the App
Connect your device/emulator and run the app using:

*bash
flutter run

*Usage
Upon launching the app, the weather for a default city (e.g., default to your location or a specific city) will be displayed.
Use the search bar to enter a city name and press enter to fetch weather information for that city.
The app will handle edge cases like incorrect city names gracefully.
