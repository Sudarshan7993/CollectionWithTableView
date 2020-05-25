//
//  CategoryColCell.swift
//  CategoryTableView
//
//  Created by Mayur on 25/05/20.
//  Copyright © 2020 Xe. All rights reserved.
//

import UIKit

class CategoryColCell:UICollectionViewCell{
    
    var category :Category!{
        didSet{
            setupViews()
        }
    }
    
    private let categoryLabel:UILabel={
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    fileprivate func setupViews(){
        contentView.layer.cornerRadius = contentView.frame.height/2
        self.contentView.addSubview(categoryLabel)
        categoryLabel.text = category.name
        
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                contentView.backgroundColor = .init(red: 25.0/255.0,
                                                         green: 25.0/255.0,
                                                         blue: 25.0/255.0,
                                                         alpha: 1.0)
                categoryLabel.textColor = .white
            }else{
                contentView.backgroundColor = .white
                categoryLabel.textColor = .black
            }
        }
    }
}
