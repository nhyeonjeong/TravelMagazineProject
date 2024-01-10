//
//  CityViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/10.
//

import UIKit

// segmnet위해 Enum연습 겸 넣음
enum TravelLocation: String, CaseIterable {
    case all = "모두"
    case local = "국내"
    case abroad = "해외"
}


class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var domesticSegment: UISegmentedControl!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    let domestic = TravelLocation.allCases
    
    let city: [City] = CityInfo().city
    var filterdCity: [City] = [] // segment기능 구현 위한 또 다른 리스트

    var width: CGFloat = UIScreen.main.bounds.width
    let verticalSpacing: CGFloat = 10
    let horizontalSpacing: CGFloat = 20
    let inset: CGFloat = 20
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterdCity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityReuseCollectionViewCell.identifier, for: indexPath) as! CityReuseCollectionViewCell
        
        cell.configureCell(data: filterdCity[indexPath.item], cellWidth: width)
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기 도시"
        filterdCity = city
        
        collectionViewRegister()

        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        width = (UIScreen.main.bounds.width - (inset * 2 + horizontalSpacing)) / 2
        
        // 레이아웃 잡기
        cityCollectionView.collectionViewLayout = settingCollectionViewLayout(cellWidth: width)
    }
    
    /// xib, register
    func collectionViewRegister() {
        // 어차피 폴더명이랑 identifier랑 같으니까 static 변수로 같이 쓰기
        let xib = UINib(nibName: CityReuseCollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityReuseCollectionViewCell.identifier)
    }
    
    /// CollectionView의 레이아웃잡기
    func settingCollectionViewLayout(cellWidth width: CGFloat) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width + 74)
        layout.minimumLineSpacing = verticalSpacing
        layout.minimumInteritemSpacing = horizontalSpacing
        layout.sectionInset = UIEdgeInsets(top: inset , left: inset, bottom: inset, right: inset)
        
        return layout
    }
    
    @IBAction func segmentClicked(_ sender: UISegmentedControl) {
        let domesticTravel = domestic[sender.selectedSegmentIndex]
        
        if domesticTravel == .local {
            filterdCity = city.filter({$0.domestic_travel})
        } else if domesticTravel == .abroad {
            filterdCity = city.filter({$0.domestic_travel == false})
        } else {
            filterdCity = city
        }
        
        cityCollectionView.reloadData() // 데이터 변경했으니 다시 로딩
    }
    
}
