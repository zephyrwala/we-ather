
# We-Ather

# WeatherManager.swift

## Overview

`WeatherManager` is a Swift utility class that provides functionality to fetch weather data from the OpenWeatherMap API. This class leverages the CoreLocation framework to obtain weather information based on geographical coordinates (latitude and longitude). The retrieved weather data is then decoded into a specified Codable type.

## Usage
## Installation
To install this package, import 'https://github.com/zephyrwala/we-ather.git' in Swift Package Manager

### Initialization

```swift
let weatherManager = WeatherManager()
```

### Fetch Weather Data

To retrieve weather data, use the `fetchWeather` method:

```swift
WeatherManager.fetchWeather(dataType: YourDataType.self,
                             lat: yourLatitude,
                             lon: yourLongitude,
                             apiKey: "yourApiKey") { result in
    switch result {
    case .success(let weatherData):
        // Handle successful weather data retrieval
        print(weatherData)
    case .failure(let error):
        // Handle error
        print("Error: \(error.localizedDescription)")
    }
}
```

Make sure to replace `YourDataType` with the type you want to decode the weather data into, `yourLatitude` and `yourLongitude` with the desired geographical coordinates, and `"yourApiKey"` with your OpenWeatherMap API key.

### API Key

Before using the `WeatherManager`, make sure to obtain an API key from [Open Weather Map API](https://openweathermap.org/api). You can get your API key [here](https://openweathermap.org/api).

## Example

Here's an example of using the `WeatherManager` to fetch weather data:

```swift
let latitude = 12.932833957416554
let longitude = 77.60332444777305
let apiKey = "yourApiKey"

WeatherManager.fetchWeather(dataType: YourDataType.self,
                             lat: latitude,
                             lon: longitude,
                             apiKey: apiKey) { result in
    switch result {
    case .success(let weatherData):
        // Handle successful weather data retrieval
        print(weatherData)
    case .failure(let error):
        // Handle error
        print("Error: \(error.localizedDescription)")
    }
}
```

## Note

Ensure that the CoreLocation framework is properly integrated into your project, and you have the necessary permissions to access the device's location.

Feel free to customize and extend the `WeatherManager` to suit your specific needs.
