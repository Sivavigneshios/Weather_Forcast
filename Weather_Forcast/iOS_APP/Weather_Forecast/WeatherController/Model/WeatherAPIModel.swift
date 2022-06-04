//
//  WeatherAPIModel.swift
//  Weather_Forecast
//
//  Created by User on 04/06/22.
//

import Foundation

class CSFetchForcastApiModel: NSObject {
    
   class func fetchforeCastData(parentView: AnyObject,
                                    url: String,
                                    completionHandler: @escaping(_ response: WeatherListMapper) -> Void) {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if error == nil {
                let content = String(data: (data)!, encoding: String.Encoding.utf8)
                let responseData = Mapper<WeatherListMapper>().map(JSONString: content!)
                completionHandler(responseData!)
            } else {
                print("Unexpected Error:\(error.debugDescription)")
            }
        })
        task.resume()
        
    }
}
