//
//  ViewController.swift
//  Weather_Forecast
//
//  Created by User on 04/06/22.
//

import UIKit

class WeatherController: UIViewController {
    
    // MARK: - Variable Declaration
    lazy var searchBar:UISearchBar = UISearchBar()
    let navigationBGView = UIView()
    var weatherTableView = UITableView()
    
    var locationDetails : LocationDetails?
    var forCastData = [WeatherDetails]()

    
    
    // MARK: - Program Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadUIComponents()
        
        fetchForCastData()
    }
    
    // MARK: - Load UIComponents
    func loadUIComponents() {
        
        navigationBGView.backgroundColor = UIColor().hexStringToUIColor(hex: themeColour)
        navigationBGView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor().hexStringToUIColor(hex: backgroundColour)
        view.addSubview(navigationBGView)
        
        //navigationBGView
        NSLayoutConstraint(item: navigationBGView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: navigationBGView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: navigationBGView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: navigationBGView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 70).isActive = true
                
        //Table View
        weatherTableView  = UITableView(frame: UIScreen.main.bounds, style: .plain)
        weatherTableView.backgroundColor = UIColor.clear
        weatherTableView.separatorStyle = .none
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        //Regsiter TableView Cell
        weatherTableView.register( CityInfoTableViewCell.self, forCellReuseIdentifier: "CityInfoTableViewCell")
        weatherTableView.register( ForCastInfoTableViewCell.self, forCellReuseIdentifier: "ForCastInfoTableViewCell")
        weatherTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weatherTableView)
       
        
        NSLayoutConstraint(item: weatherTableView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: weatherTableView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: navigationBGView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: weatherTableView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant:0).isActive = true
        NSLayoutConstraint(item: weatherTableView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant:0).isActive = true
        
    }

    
    
}


