//
//  ViewController.swift
//  WeatherSence
//
//  Created by Андрей Гончаров on 02/04/2018.
//  Copyright © 2018 Goncharov Andrei. All rights reserved.
//

import UIKit

class MainController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.addSubview(backgroundImage)
        view.addSubview(cityLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(searchBar)
        view.addSubview(temperatureFeelTextLabel)
        view.addSubview(resetButton)
        view.addSubview(temperatureWindTextLabel)
        view.addSubview(temperatureConditionTextLabel)
        view.addSubview(temperatureImage)
        setupTemeratureImage()
        setupTemperatureConditionTextLabel()
        setupTemperatureWindTextLabel()
        setupSearchBar()
        setupCityLabel()
        setupTemperatureLabel()
        setupResetButton()
        setupTemperatureFeelTextLabel()
    }
    
    let temperatureImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let searchBar: UISearchBar = {
        let searchB = UISearchBar()
        searchB.translatesAutoresizingMaskIntoConstraints = false
        searchB.searchBarStyle = .minimal
        searchB.clearsContextBeforeDrawing = true
        searchB.placeholder = "Enter city..."
        searchB.sizeToFit()
        return searchB
    }()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"background")
        image.frame = CGRect(x: 0, y: 0, width: 800, height: 800)
        return image
    }()
    
    let temperatureConditionTextLabel: UILabel = {
        let condition = UILabel()
        condition.adjustsFontSizeToFitWidth = true
        condition.textColor = UIColor.black
        condition.textAlignment = .center
        condition.font = UIFont.systemFont(ofSize: 28)
        condition.translatesAutoresizingMaskIntoConstraints = false
        condition.isHidden = true
        return condition
    }()
    
    let cityLabel: UILabel = {
        let city = UILabel()
        city.textAlignment = .center
        city.adjustsFontSizeToFitWidth = true
        city.textColor = UIColor.black
        city.font = UIFont.systemFont(ofSize: 28)
        city.layer.cornerRadius = 25
        city.layer.masksToBounds = true
        city.translatesAutoresizingMaskIntoConstraints = false
        city.isHidden = true
        return city
    }()
    
    let temperatureFeelTextLabel: UILabel = {
        let temperatureText = UILabel()
        temperatureText.textAlignment = .center
        temperatureText.adjustsFontSizeToFitWidth = true
        temperatureText.textColor = UIColor.black
        temperatureText.font = UIFont.systemFont(ofSize: 28)
        temperatureText.layer.cornerRadius = 25
        temperatureText.layer.masksToBounds = true
        temperatureText.translatesAutoresizingMaskIntoConstraints = false
        temperatureText.isHidden = true
       return temperatureText
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.lightGray
        button.tintColor = UIColor(red: 10/255 , green: 20/255, blue: 60/255, alpha: 1)
        button.setTitle("clear", for: .normal)
        button.addTarget(self, action: #selector(handleResetButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    let temperatureLabel: UILabel = {
        let temperature = UILabel()
        temperature.textAlignment = .center
        temperature.font = UIFont.systemFont(ofSize: 28)
        temperature.textColor = UIColor.black
        temperature.layer.cornerRadius = 25
        temperature.layer.masksToBounds = true
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.isHidden = true
        return temperature
    }()
    
    let temperatureWindTextLabel: UILabel = {
        let wind = UILabel()
        wind.textAlignment = .center
        wind.adjustsFontSizeToFitWidth = true
        wind.font = UIFont.systemFont(ofSize: 28)
        wind.textColor = UIColor.black
        wind.adjustsFontSizeToFitWidth = true
        wind.translatesAutoresizingMaskIntoConstraints = false
        return wind
    }()
    
    @objc func handleResetButton() {
        temperatureLabel.isHidden = true
        temperatureFeelTextLabel.isHidden = true
        cityLabel.isHidden = true
        resetButton.isHidden = true
        searchBar.enablesReturnKeyAutomatically = true
        temperatureConditionTextLabel.isHidden = true
        temperatureWindTextLabel.isHidden = true
        temperatureImage.isHidden = true
    }
    
    func setupTemeratureImage() {
        temperatureImage.topAnchor.constraint(equalTo: temperatureLabel.topAnchor).isActive = true
        temperatureImage.leftAnchor.constraint(equalTo: temperatureLabel.rightAnchor, constant: 10).isActive = true
        temperatureImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        temperatureImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupTemperatureConditionTextLabel() {
        temperatureConditionTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        temperatureConditionTextLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 30).isActive = true
        temperatureConditionTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        temperatureConditionTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTemperatureWindTextLabel() {
        temperatureWindTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        temperatureWindTextLabel.topAnchor.constraint(equalTo: temperatureFeelTextLabel.bottomAnchor, constant: 30).isActive = true
        temperatureWindTextLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        temperatureWindTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupResetButton() {
        resetButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTemperatureFeelTextLabel() {
        temperatureFeelTextLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        temperatureFeelTextLabel.topAnchor.constraint(equalTo: temperatureConditionTextLabel.bottomAnchor, constant: 30).isActive = true
        temperatureFeelTextLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        temperatureFeelTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSearchBar() {
        searchBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 22).isActive = true
        searchBar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 47).isActive = true
    }
    
    func setupCityLabel() {
        cityLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 30).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTemperatureLabel() {
        temperatureLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 30).isActive = true
        temperatureLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        var locaitionName: String?
        var locaitionCountry: String?
        var locationTemperature: Double?
        var locationTemperatureText: String?
        var locationTemperatureWind: Double?
        var locationTemperatureWindText: String?
        var locationTemperatureCondition: String?
        var locationTemperatureConditionText: String?
        var locationTemperatureImageUrl: String!
        var errorOccured: Bool = false
        
        let urlString = "https://api.apixu.com/v1/current.json?key=f68d0ac1b7de4df9b0e102524182303&q=\(searchBar.text!)".replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) {[weak self] (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let _ = json["error"] {
                    errorOccured = true
                } else {
                    if let location = json["location"]  {
                        locaitionName = location["name"] as?  String
                    }
                    if let temperature = json["current"] {
                        locationTemperature = temperature["temp_c"] as? Double
                    }
                    if let feel = json["current"] {
                        locationTemperatureWind = feel["wind_mph"] as? Double
                    }
                    if let country = json["location"] {
                        locaitionCountry = country["country"] as? String
                    }
                    if let current = json["current"] as? [String: AnyObject] {
                        if let condition = current["condition"] as? [String: AnyObject] {
                            locationTemperatureCondition = condition["text"] as? String
                            let icon = condition["icon"] as! String
                            locationTemperatureImageUrl = "https:\(icon)"
                            }
                    }
  
                    switch locationTemperature! {
                    case 0:
                        locationTemperatureText = "Zero"
                    case 1...10.9:
                        locationTemperatureText = "Only cool do not put on a hat"
                    case 11...15.9:
                        locationTemperatureText = "Possible in shorts"
                    case 16...20.9:
                        locationTemperatureText = "In the shirt it will be fine"
                    case 21...30.9:
                        locationTemperatureText = "Damn, it is hot"
                    case 31...40.9:
                        locationTemperatureText = "Better hide in the pool"
                    case (-10)...(-0.9):
                        locationTemperatureText = "Do not forget the scarf and hat"
                    case (-20)...(-10.9):
                        locationTemperatureText = "It is really cold, dress warmer"
                    case (-30)...(-20.9):
                        locationTemperatureText = "Panties are obligatory for putting on, two pairs!"
                    case (-40)...(-30.9):
                        locationTemperatureText = "Sit by the fireplace, do not go anywhere!"
                    default:
                        locationTemperatureText = "Don't even know"
                    }
                    
                    switch locationTemperatureWind! {
                    case 0:
                        locationTemperatureWindText = "There is no wind at all"
                    case 1...10.9:
                        locationTemperatureWindText = "Weak breeze"
                    case 11...20.9:
                        locationTemperatureWindText = "The wind is decent, the hood is musthave"
                    case 21...50:
                        locationTemperatureWindText = "Hurricane!"
                    default:
                        locationTemperatureWindText = "Noone knows"
                    }
                    
                    switch locationTemperatureCondition! {
                    case "Sunny":
                        locationTemperatureConditionText = "Hooh, finally sunny"
                    case "Cloudy":
                        locationTemperatureConditionText = "Oops, cloudy, maybe rainy soon"
                    case "Clear":
                        locationTemperatureConditionText = "Yes! Zero clouds"
                    case "Overcast":
                        locationTemperatureConditionText = "Overcast"
                    case "Mist":
                        locationTemperatureConditionText = "Freezing fog"
                    case "Patchy rain possible":
                        locationTemperatureConditionText = "Patchy rain possible"
                    case "Patchy snow possible":
                        locationTemperatureConditionText = "Patchy snow possible"
                    case "Patchy sleet possible":
                        locationTemperatureConditionText = "Patchy sleet possible"
                    case "Patchy freezing drizzle possible":
                        locationTemperatureConditionText = "Patchy freezing drizzle possible"
                    case "Thundery outbreaks possible":
                        locationTemperatureConditionText = "Thundery outbreaks possible"
                    case "Blowing snow":
                        locationTemperatureConditionText = "Blowing snow"
                    case "Blizzard":
                        locationTemperatureConditionText = "Blizzard"
                    case "Light drizzle":
                        locationTemperatureConditionText = "Light drizzle"
                    case "Heavy freezing drizzle":
                        locationTemperatureConditionText = "Heavy freezing drizzle"
                    case "Light rain":
                        locationTemperatureConditionText = "Light rain"
                    case "Heavy rain":
                        locationTemperatureConditionText = "Heavy rain"
                    case "Light sleet":
                        locationTemperatureConditionText = "Light sleet"
                    case "Light snow":
                        locationTemperatureConditionText = "Light snow"
                    case "Heavy snow":
                        locationTemperatureConditionText = "Heavy snow"
                    case "Ice pellets":
                        locationTemperatureConditionText = "Ice pellets"
                    case "Moderate or heavy snow with thunder":
                        locationTemperatureConditionText = "Moderate or heavy snow with thunder"
                    default:
                        locationTemperatureConditionText = "Can not see"
                    }
                }
                DispatchQueue.main.async {
                    if errorOccured == true {
                        self?.cityLabel.text = "No this city on Earth"
                        self?.temperatureFeelTextLabel.isHidden = true
                        self?.temperatureLabel.isHidden = true
                        self?.temperatureConditionTextLabel.isHidden = true
                        self?.temperatureWindTextLabel.isHidden = true
                        self?.temperatureImage.isHidden = true
                    } else {
                        self?.resetButton.isHidden = false
                        self?.temperatureImage.isHidden = false
                        self?.cityLabel.isHidden = false
                        self?.temperatureLabel.isHidden = false
                        self?.temperatureFeelTextLabel.isHidden = false
                        self?.temperatureWindTextLabel.isHidden = false
                        self?.temperatureConditionTextLabel.isHidden = false
                        self?.cityLabel.text = "\(locaitionName!), \(locaitionCountry!)"
                        self?.temperatureLabel.text = "\(locationTemperature!)°"
                        self?.temperatureFeelTextLabel.text = locationTemperatureText
                        self?.temperatureWindTextLabel.text = locationTemperatureWindText
                        self?.temperatureConditionTextLabel.text = locationTemperatureConditionText
                        self?.temperatureImage.downloadedFrom(link: locationTemperatureImageUrl!)
                    }
                }
            }
            catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

