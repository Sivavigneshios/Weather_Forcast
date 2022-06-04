//
//  WeatherController+Extension.swift
//  Weather_Forecast
//
//  Created by User on 04/06/22.
//

import Foundation
import UIKit

//MARK: - API Call
extension WeatherController {
    
    func fetchForCastData() {
        CSFetchForcastApiModel.fetchforeCastData(parentView: self, url: WeatherAPI) { response in
            DispatchQueue.main.async {
                self.locationDetails = response.location
                self.forCastData = response.forcastDetals?.forCastData ?? [WeatherDetails]()
                self.weatherTableView.reloadData()
            }
        }
    }
}

//MARK: - TableView Delegate
extension WeatherController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : forCastData.count > 0 ? forCastData.count  : 0
    }
    /// table height set
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityInfoTableViewCell", for: indexPath) as?
                CityInfoTableViewCell else { return UITableViewCell() }
            (locationDetails != nil) ? cell.getLocationData(details: locationDetails!) : ()
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForCastInfoTableViewCell", for: indexPath) as?
                    ForCastInfoTableViewCell else { return UITableViewCell() }
            cell.getforecastData(details: forCastData[indexPath.row])
            return cell
        }
    }
}




