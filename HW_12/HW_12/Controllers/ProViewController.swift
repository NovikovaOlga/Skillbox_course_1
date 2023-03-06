
//https://api.openweathermap.org/data/2.5/forecast?q=moscow&appid=053f04c8d52212eafda9e89bd26642bf&units=metric
// здесь 3 контроллер (Step Pro) с поиском города в двух вариантах

import UIKit

class ProViewController: UIViewController {
    
    // менеджеры сетевых запросов
    var networkWeatherManager = NetworkWeatherManager()
    let forecastNetworkWeatherManager = ForecastNetworkWeatherManager() 
    
    var forecastWeatherData: ForecastWeatherData? = nil // модель данных
    
    @IBOutlet weak var weatherIconImageViewPro: UIImageView!
    @IBOutlet weak var cityLabelPro: UILabel!
    @IBOutlet weak var temperatureLabelPro: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabelPro: UILabel!
    
    @IBAction func searchButton(_ sender: Any) {  // поиск кнопкой
        searchButton(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in  // [unowned self]  - гарантируем, что self существует на момент завершения
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }
    }
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var dateTitlePro: UILabel! // чтобы скрыть и отобразить после загрузки данных (для красоты)
    @IBOutlet weak var tempTitlePro: UILabel!
    @IBOutlet weak var feelsTitlePro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupView()
        searchButton(self)
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in // текущая погода
            guard let self = self else { return }  // [weak self] - точно знаем, что нет цикла сильных ссылок
            self.updateInterfaceWith(weather: currentWeather) // обновим интерфейс
        }
    }
    
    func updateInterfaceWith(weather: CurrentWeather) { // поиск 1 (обновим интерфейс для продолжения работы)
        DispatchQueue.main.async {
            self.cityLabelPro.text = weather.cityName
            self.temperatureLabelPro.text = ("\(weather.temperatureString) °C")
            self.feelsLikeTemperatureLabelPro.text = ("feels like \(weather.feelsLikeTemperatureString) °C")
            self.weatherIconImageViewPro.image = UIImage(systemName: weather.systemIconNameString)  // к иконкам
            
            // проверка видимости элементов (после сетевого запроса), чтобы не крэшнулось (много строк - придумать как зациклить: например собрать элементы в массив(?) и проверять их видимость)
            if  self.weatherIconImageViewPro.isHidden == true {
                self.weatherIconImageViewPro.isHidden = false
            }
            
            if self.cityLabelPro.isHidden == true {
                self.cityLabelPro.isHidden = false
            }
            
            if self.temperatureLabelPro.isHidden == true {
                self.temperatureLabelPro.isHidden = false
            }
            
            if self.feelsLikeTemperatureLabelPro.isHidden == true {
                self.feelsLikeTemperatureLabelPro.isHidden = false
            }
            
            if self.dateTitlePro.isHidden == true {
                self.dateTitlePro.isHidden = false
            }
            
            if self.tempTitlePro.isHidden == true {
                self.tempTitlePro.isHidden = false
            }
            
            if self.feelsTitlePro.isHidden == true {
                self.feelsTitlePro.isHidden = false
            }
        }
    }
    
    private func setupTableView() {
        table.isHidden = true // сделаем таблицу невидимой до загрузки данных (некрасиво моргает белым цветом)
        table.dataSource = self
    }
    
    private func setupView() { // скроем блок с текущими данными погоды до загрузки данных
        weatherIconImageViewPro.isHidden = true
        cityLabelPro.isHidden = true
        temperatureLabelPro.isHidden = true
        feelsLikeTemperatureLabelPro.isHidden = true
        dateTitlePro.isHidden = true
        tempTitlePro.isHidden = true
        feelsTitlePro.isHidden = true
    }
}

extension ProViewController { //поиск 1 - кнопкой
    func searchButton(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) { // клоужер для передачи города completionHandler, где String - название города
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { _ in
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
                //  let city = cityName.split(separator: " ").joined(separator: "%20") // если город это несколько элементов через пробел, то соединим его (Нью Йорк)
                //  completionHandler(city) // передаем город
            }
            let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)&units=metric" // строка с адресом (тип - String). ВАЖНО: &units=metric - с сайта openWeather, чтобы градусы были в цельсиях, а не в кельвинах
            
            self.forecastNetworkWeatherManager.request(urlString: urlString) { [weak self] (list) in
                switch list {
                case .success(let forecastWeatherData):
                    self?.forecastWeatherData = forecastWeatherData // передали данные
                    self?.table.reloadData()
                case .failure(let error):
                    print("error:", error)
                }
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}

extension ProViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastWeatherData?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        table.layer.backgroundColor = UIColor.clear.cgColor // прозрачная таблица
        
        let cell = table.dequeueReusableCell(withIdentifier: "cellTablePro", for: indexPath) as! ProForecastTableViewCell
        let weather = forecastWeatherData?.list[indexPath.row]// получим показатель по indexPath
        
        // температура и -ощущается как- в формате Double - округлим и преобразуем в String
        let temp = weather?.main.temp
        var tempString: String {
            return String(format: "%.0f", temp!) //  не уверена в правильности принудительного извлечения
        }
        
        let feelsLike = weather?.main.feelsLike
        var feelsLikeString: String {
            return String(format: "%.0f", feelsLike!)
        }
        
        cell.dateTimeLabelPro.text = weather?.dtTxt
        cell.tempLabelPro.text = tempString
        cell.feelsLikeLabelPro.text = ("\(feelsLikeString) °C")
        
        table.isHidden = false // сделаем таблицу видимой (если вернуть видимость в updateInterfaceWith - она моргает белым )
        
        return cell
    }
}
