import Foundation

struct WeatherModel {
    let imageNames: [String]
    let imageDescriptions: [String: String]
        
    init() {
        self.imageNames = ["storm", "rain", "cloudy", "snow", "clear"]
        self.imageDescriptions = [
            "storm": NSLocalizedString("storm", comment: ""),
            "rain": NSLocalizedString("rain", comment: ""),
            "cloudy": NSLocalizedString("cloudy", comment: ""),
            "snow": NSLocalizedString("snow", comment: ""),
            "clear": NSLocalizedString("clear", comment: "")
        ]
    }
}
