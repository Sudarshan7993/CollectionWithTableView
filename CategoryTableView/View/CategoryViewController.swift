//
//  ViewController.swift
//  CategoryTableView
//
//  Created by Mayur on 25/05/20.
//  Copyright © 2020 Xe. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let _categoryCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.indicatorStyle = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()

    let _mealsTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let topImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Biryani"))
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let _mainScrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        _categoryCollectionView.register(CategoryColCell.self,
                                         forCellWithReuseIdentifier: "Colcell")
        _mealsTableView.register(MealCellView.self,
                                 forCellReuseIdentifier: "cell")
        _categoryCollectionView.delegate = self
        _categoryCollectionView.dataSource = self
        _mealsTableView.delegate = self
        _mealsTableView.dataSource = self
        _mainScrollView.delegate = self
        
        _categoryCollectionView.isHidden = true
    }
    
    fileprivate func setupViews(){
        self.view.backgroundColor = .white
        let screenSize = UIScreen.main.bounds
        _mainScrollView.contentSize = CGSize(width: screenSize.width-10, height: screenSize.height+130)
        self.view.addSubview(_mainScrollView)
        _mainScrollView.addSubview(topImageView)
        _mainScrollView.addSubview(_categoryCollectionView)
        _mainScrollView.addSubview(_mealsTableView)
        
        NSLayoutConstraint.activate([
            _mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            _mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            _mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            _mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            topImageView.topAnchor.constraint(equalTo: _mainScrollView.topAnchor, constant: 10),
            topImageView.widthAnchor.constraint(equalToConstant: screenSize.width-10),
            topImageView.heightAnchor.constraint(equalToConstant: 200),
            
            _categoryCollectionView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 10),
            _categoryCollectionView.heightAnchor.constraint(equalToConstant: 50),
            _categoryCollectionView.widthAnchor.constraint(equalTo: topImageView.widthAnchor),
            
            _mealsTableView.topAnchor.constraint(equalTo: _categoryCollectionView.bottomAnchor, constant: 10),
            _mealsTableView.heightAnchor.constraint(equalToConstant: screenSize.height-110),
            _mealsTableView.widthAnchor.constraint(equalTo: _categoryCollectionView.widthAnchor)
        ])
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let indexPath = IndexPath(item: 0, section: 0)
        _categoryCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension CategoryViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Category.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Colcell", for: indexPath) as! CategoryColCell
        cell.category = Category.categories[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = IndexPath(row: 0, section: indexPath.item)
        self._mealsTableView.selectRow(at: index, animated: true, scrollPosition: .top)
    }
}

extension CategoryViewController:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.categories.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.categories[section].meals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MealCellView
        cell.meal = Category.categories[indexPath.section].meals[indexPath.row]
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == _mealsTableView{
            let topSection = _mealsTableView.indexPathsForVisibleRows?.map{$0.section}.sorted().first ?? 0
            let indexPath = IndexPath(item: topSection, section: 0)
            _categoryCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            
            if _mealsTableView.contentOffset.y == 0{
                _mealsTableView.isScrollEnabled = false
            }else{
                _mealsTableView.isScrollEnabled = true
            }
        }
        
       if(_mainScrollView.contentOffset.y <= 130){
            _mealsTableView.isScrollEnabled = false
       }else{
            _mealsTableView.isScrollEnabled = true
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        headerView.backgroundColor = .white
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.text = Category.categories[section].name
        categoryLabel.font = .systemFont(ofSize: 25, weight: .medium)
        headerView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            categoryLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
