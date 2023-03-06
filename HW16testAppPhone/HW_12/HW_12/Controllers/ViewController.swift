
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // менеджеры сетевых запросов
    let networkWeatherManager = NetworkWeatherManager()  // адрес внутри
    let forecastNetworkWeatherManager = ForecastNetworkWeatherManager() // адрес тут
    
    var forecastWeatherData: ForecastWeatherData? = nil
    
    //  город,ключ API храним отдельно
    let citySelect = city // город (current weather)
    
    // аутлеты для текущей темературы (current weather)
    @IBOutlet weak var weatherIconImageView: UIImageView! // иконка
    @IBOutlet weak var cityLabel: UILabel! //город
    @IBOutlet weak var temperatureLabel: UILabel! // температура
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel! // температура ощущается как
    
    //для прогноза (forecast weather)
    @IBOutlet weak var table: UITableView!
    
    // чтобы скрыть и отобразить после загрузки данных (для красоты)
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var tempTitle: UILabel!
    @IBOutlet weak var feelsTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
        
        // прогноз на несколько дней
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric" // строка с адресом (тип - String). ВАЖНО: &units=metric - с сайта openWeather, чтобы градусы были в цельсиях, а не в кельвинах
        
        forecastNetworkWeatherManager.request(urlString: urlString) { [weak self] (list) in
            switch list {
            case .success(let forecastWeatherData):
                self?.forecastWeatherData = forecastWeatherData // передали данные
                self?.table.reloadData()
                
            case .failure(let error):
                print("error:", error)
            }
        }
        
        // current weather
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }  // [weak self] - точно знаем, что нет цикла сильных сылок - если проложение разрастется и будет много экранов
            self.updateInterfaceWith(weather: currentWeather) // обновим интерфейс
        }
        
        networkWeatherManager.fetchCurrentWeather(forCity: citySelect)  // вызовем функция сетеового запроса из менеджера для указанного города (current weather)
    }
    
    func updateInterfaceWith(weather: CurrentWeather) { // обновим интерфейс для продолжения работы
        DispatchQueue.main.async { // так как поток пользовательского интрйеса имеет приоритетный поток (но вызов его в бекграндном потоке), то переводим вызов этого блока в главном потоке - асинхронно (не заставим главную очередь ожидать этого блока, чтобы при долгой загрузке устройство не выглядело зависшим)
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = ("\(weather.temperatureString) °C")
            self.feelsLikeTemperatureLabel.text = ("feels like \(weather.feelsLikeTemperatureString) °C")
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
            
            // проверка видимости элементов (после сетевого запроса), чтобы не крэшнулось (много строк - придумать как зациклить: например собрать элементы в массив(?) и проверять их видимость)
            if  self.weatherIconImageView.isHidden == true {
                self.weatherIconImageView.isHidden = false
            }
            
            if self.cityLabel.isHidden == true {
                self.cityLabel.isHidden = false
            }
            
            if self.temperatureLabel.isHidden == true {
                self.temperatureLabel.isHidden = false
            }
            
            if self.feelsLikeTemperatureLabel.isHidden == true {
                self.feelsLikeTemperatureLabel.isHidden = false
            }
            
            if self.dateTitle.isHidden == true {
                self.dateTitle.isHidden = false
            }
            
            if self.tempTitle.isHidden == true {
                self.tempTitle.isHidden = false
            }
            
            if self.feelsTitle.isHidden == true {
                self.feelsTitle.isHidden = false
            }
        }
    }
    
    private func setupTableView() {
        table.isHidden = true // сделаем таблицу невидимой до загрузки данных (некрасиво моргает белым цветом)
        //     table.delegate = self // нужен для язагрузки хидера
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupView() { // скроем блок с текущими данными погоды до загрузки данных, потом отобразим (иконки моргают некрасиво)
        weatherIconImageView.isHidden = true
        cityLabel.isHidden = true
        temperatureLabel.isHidden = true
        feelsLikeTemperatureLabel.isHidden = true
        dateTitle.isHidden = true
        tempTitle.isHidden = true
        feelsTitle.isHidden = true
    }
}

extension ViewController { //: UITableViewDelegate - нужен для хидера { //}, UITableViewDataSource - вроде с этой версии не надо {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastWeatherData?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        table.layer.backgroundColor = UIColor.clear.cgColor // прозрачная таблица
        
        // let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = table.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! ForecastTableViewCell
        
        let weather = forecastWeatherData?.list[indexPath.row]
        // let eva = "\(weather?.dtTxt), temp: \(weather?.main.temp), feels like: \(weather?.main.feelsLike)"
        
        let dataTime = weather?.dtTxt
        let temp = weather?.main.temp
        var tempString: String {
            return String(format: "%.0f", temp!) //  не уверена в правильности принудительного извлечения
        }
        
        let feelsLike = weather?.main.feelsLike
        var feelsLikeString: String {
            return String(format: "%.0f", feelsLike!)
        }
        
        cell.dateTimeLabel.text = dataTime
        cell.tempLabel.text = ("\(tempString) °C")
        cell.feelsLikeLabel.text = ("\(feelsLikeString) °C")
        
        table.isHidden = false // сделаем таблицу видимой (если вернуть видимость в updateInterfaceWith - она моргает белым )
        return cell
        
    }
}
