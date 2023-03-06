// ПОГОДА НА ПЕРИОД
// менеджер сетевых запросов с применением Alamofire

import Foundation
import Alamofire

class AlamofireForecastNetworkWeatherManager {
    
    func request(urlString: String, completion: @escaping (Result <ForecastWeatherData, Error>) -> Void) {  // заменили Data (данные), на SearchResponse (наша модель), так как разница в форматах, а нам надо вытащить наруж
    
        AF.request(urlString).responseJSON { response in
            if let data = response.data {
                
                DispatchQueue.main.async { // подгрузка данных в асинхронном потоке (чтобы не было зависаний
                    
                    do {
                        let forecastWeathers = try JSONDecoder().decode(ForecastWeatherData.self, from: data)
                        completion(.success(forecastWeathers))
                    } catch let jsonError { // вернем ошибку парсинга данных
                        print("Failed to decode JSON", jsonError)
                        completion(.failure(jsonError))
                    }
                }
            }
        }
    }
}
