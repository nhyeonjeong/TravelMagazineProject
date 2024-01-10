//
//  CityFirstCollectionViewController.swift
//  TravelMagazineProject
//
//  Created by 남현정 on 2024/01/10.
//

import UIKit

private let reuseIdentifier = "Cell"

class CityFirstCollectionViewController: UICollectionViewController {

    let city: [City] = CityInfo().city
    
    // 함수에도 보내줘서 cornerRadius지정위해 여기에 선언
    var width = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 재사용위해 따로 만든 cell을 사용하기 위해
        // 2번숙제 : xib코드 추가
        let xib = UINib(nibName: "CityReuseCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "CityReuseCollectionViewCell")

        navigationItem.title = "인기 도시"
        
        let verticalSpacing: CGFloat = 10
        let horizontalSpacing: CGFloat = 20
        let inset: CGFloat = 20
        
        width = (UIScreen.main.bounds.width - (inset * 2 + horizontalSpacing)) / 2
    
        // 레이아웃 잡기
        let layout = UICollectionViewFlowLayout()
        
        // 높이 계산함...(이게 맞나^^) width + 줬던 패딩 + label높이 대충 계산..
        // label 두개를 stackview로 묶어줬는데 아래 label은 높이를 따로 부여하지 않아서 정확한 cell의 높이를 못 구하겠음.
        layout.itemSize = CGSize(width: width, height: width + 74)
        layout.minimumLineSpacing = verticalSpacing
        layout.minimumInteritemSpacing = horizontalSpacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        // UICollectionViwFlowLayout타입이 어떻게 CollectionViewLayout타입에 할당되는지? ->
        collectionView.collectionViewLayout = layout
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    // cellForItemAt 에 많은 코드 부담않기 위해 UICollectionViewCell쪽에 전가
    // 2번숙제 : withReuseIdentifier 바꿔주기
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityReuseCollectionViewCell", for: indexPath) as! CityReuseCollectionViewCell
        
        cell.configureCell(data: city[indexPath.item], cellWidth: width)
        
        return cell
    }

}
