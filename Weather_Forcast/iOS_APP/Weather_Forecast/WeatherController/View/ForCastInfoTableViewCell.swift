//
//  ForCastInfoTableViewCell.swift
//  Weather_Forecast
//
//  Created by User on 04/06/22.
//

import UIKit

class ForCastInfoTableViewCell: UITableViewCell {
    
    let backroundView = UIStackView()
    let contentBGview = UIStackView()
    
    let weatherIcon = UIImageView()
    
    let minimumTempLabel = UILabel()
    let maximumTempLabel = UILabel()
    let dataAndTimeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        //First Call Super
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        contentBGview.axis = .vertical
        contentBGview.distribution = .equalSpacing
        contentBGview.translatesAutoresizingMaskIntoConstraints = false
        contentBGview.isLayoutMarginsRelativeArrangement = true
        
        minimumTempLabel.font = UIFont.systemFont(ofSize: 16.0)
        maximumTempLabel.font = UIFont.systemFont(ofSize: 16.0)
        dataAndTimeLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        minimumTempLabel.textColor = UIColor.darkGray
        maximumTempLabel.textColor = UIColor.darkGray
        dataAndTimeLabel.textColor = UIColor.darkGray
        
        contentBGview.addArrangedSubview(minimumTempLabel)
        contentBGview.addArrangedSubview(maximumTempLabel)
        contentBGview.addArrangedSubview(dataAndTimeLabel)

        backroundView.backgroundColor = UIColor.white
        backroundView.axis = .horizontal
        backroundView.distribution = .fill
        backroundView.translatesAutoresizingMaskIntoConstraints = false
        backroundView.layoutMargins = UIEdgeInsets(top:10, left: 10, bottom: 10, right: 10)
        backroundView.isLayoutMarginsRelativeArrangement = true
        backroundView.spacing = 10
        backroundView.addArrangedSubview(weatherIcon)
        backroundView.addArrangedSubview(contentBGview)
        contentView.addSubview(backroundView)
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: weatherIcon, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: weatherIcon, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 60).isActive = true

        
        
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant:15).isActive = true
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: backroundView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant:0).isActive = true

     
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
    
    func getforecastData(details:WeatherDetails) {
        minimumTempLabel.text = "\(details.dayDetails?.minimumTemp ?? 0)" + "° c"
        maximumTempLabel.text = "\(details.dayDetails?.maximumTemp ?? 0)" + "° c"
        dataAndTimeLabel.text = self.setDateFormat(details.date) 
        weatherIcon.contentMode = .scaleAspectFit
        let url = URL(string: "https:\(details.dayDetails?.condition?.currentConditionIcon ?? "")")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                if data != nil{
                    self.weatherIcon.image = UIImage(data: data!)
                }
            }
        }
    }
    
    func setDateFormat(_ date: String) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd"
       dateFormatter.calendar = Calendar(identifier: .iso8601)
       if let dateFromString = dateFormatter.date(from: date) {
           dateFormatter.dateFormat = "MMM dd yyyy"
           dateFormatter.timeZone = .current
           return dateFormatter.string(from: dateFromString)
       } else { return "" }
   }

    
}
