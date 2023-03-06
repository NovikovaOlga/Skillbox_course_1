// ТЕКУЩАЯ ПОГОДА
// менеджер сетевых запросов с применением Alamofire

import Foundation
import Alamofire

class AlamofireNetworkWeatherManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    func fetchCurrentWeather(forCity city: String) { // функция сетевого запроса с запросом города
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
        
        AF.request(urlString).responseJSON { response in
            if let data = response.data {
        
                if let currentWeather = self.parseJSON(withData: data) { // здесь парсим наш джейсон
                    self.onCompletion?(currentWeather)
                }
            }
        }
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? { // распарсим данные (разложим данные по модели, которую мы создали)
        let decoder = JSONDecoder() // докидируем данные (раскодируем информацию из джейсона и вернем объект)
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data) // как декодировать (если есть try, то всегда есть do-catch блок)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { // передадим данные
                return nil // если данные не передали, то вернем нил
            }
            return currentWeather // если объект создан, то вернем его
        } catch let error as NSError { //
            print(error.localizedDescription)
        }
        return nil
    }
}
