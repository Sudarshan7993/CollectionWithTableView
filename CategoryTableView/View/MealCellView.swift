//
//  MealCellView.swift
//  CategoryTableView
//
//  Created by Mayur on 25/05/20.
//  Copyright © 2020 Xe. All rights reserved.
//

import UIKit

class MealCellView:UITableViewCell{
    
    var meal:Meal!{
        didSet{
            setupViews()
        }
    }
    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    fileprivate func setupViews(){
        titleLabel.text = meal.name
        priceLabel.text = "Rs. \(meal.price ?? 0)"
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
        ])
    }
}
