//
//  CityInfoTableViewCell.swift
//  Weather_Forecast
//
//  Created by User on 04/06/22.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {
    
    let backroundView = UIStackView()
    let cityLabel = UILabel()
    let countryLabel = UILabel()
    let dataAndTimeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        //First Call Super
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
          
        cityLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        countryLabel.font = UIFont.systemFont(ofSize: 16.0)
        dataAndTimeLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        cityLabel.textColor = UIColor.black
        countryLabel.textColor = UIColor.black
        dataAndTimeLabel.textColor = UIColor.black
        
        backroundView.addArrangedSubview(cityLabel)
        backroundView.addArrangedSubview(countryLabel)
        backroundView.addArrangedSubview(dataAndTimeLabel)
        backroundView.backgroundColor = UIColor.white
        backroundView.axis = .vertical
        backroundView.distribution = .equalSpacing
        backroundView.translatesAutoresizingMaskIntoConstraints = false
        backroundView.layoutMargins = UIEdgeInsets(top:10, left: 10, bottom: 10, right: 10)
        backroundView.isLayoutMarginsRelativeArrangement = true
        
        contentView.addSubview(backroundView)
        
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant:5).isActive = true
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 90).isActive = true
     
    }


    ///------------
    //Method: Init with Coder
    //Purpose:
    //Notes: This function is apparently required; gets called by default if you don't call "registerClass, forCellReuseIdentifier" on your tableview
    ///------------
    required init?(coder aDecoder: NSCoder)
    {
        //Just Call Super
        super.init(coder: aDecoder)
        
    }
    
    func getLocationData(details: LocationDetails) {
        cityLabel.text = details.city
        countryLabel.text = "Country: \(details.country)"
        dataAndTimeLabel.text = "Date: \(self.setDateFormat(details.currentDataAndTime))"
    }
    
    func setDateFormat(_ date: String) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:"
       dateFormatter.calendar = Calendar(identifier: .iso8601)
       if let dateFromString = dateFormatter.date(from: date) {
           dateFormatter.dateFormat = "MMM dd yyyy hh:mm a"
           dateFormatter.timeZone = .current
           return dateFormatter.string(from: dateFromString)  // 19-08-2015 06:00 AM -0300"
       } else { return "" }
   }

}

 
