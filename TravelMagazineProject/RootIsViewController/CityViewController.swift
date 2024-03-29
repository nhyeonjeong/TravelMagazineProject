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
protocol ViewProtocol {
    func configureView()
}

// fouthweekProject에서 configuretableView 함수와 같은 것(거기서는 따로 프로토콜로 빼주지는 않았음)
protocol CollectionViewControllerSetting {
    func collectionViewRegister() // xib설정
    func settingCollectionViewLayout(cellWidth width: CGFloat) -> UICollectionViewFlowLayout // Collectionview의 레이아웃 잡아줘야함
}

class CityViewController: UIViewController {
    
    @IBOutlet weak var citySearchBar: UISearchBar!
    @IBOutlet var domesticSegment: UISegmentedControl!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    // [.all, .local, .abroad]리스트
    let domestic = TravelLocation.allCases
    
    let city: [City] = CityInfo().city
    var filterdCity: [City] = [] // segment기능 구현 위한 또 다른 리스트

    var width: CGFloat = UIScreen.main.bounds.width
    let verticalSpacing: CGFloat = 10
    let horizontalSpacing: CGFloat = 20
    let inset: CGFloat = 20
    
    var currentSegmentIdx: Int = 0 // 서치바 위해 현재 세그먼트위치 저장

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기 도시"
        collectionViewRegister()
        
        configureView()
        
        width = (UIScreen.main.bounds.width - (inset * 2 + horizontalSpacing)) / 2
        
        // 레이아웃 함수에서 처리후 collectionViewLayout에 넘기기
        cityCollectionView.collectionViewLayout = settingCollectionViewLayout(cellWidth: width)
        
//        designElements()
    }
    
    // 세그멘트 선택 시
    @IBAction func segmentClicked(_ sender: UISegmentedControl) {
        currentSegmentIdx = sender.selectedSegmentIndex
        // 눌린 세그먼트의 TravelLocation타입
        let domesticTravel = domestic[currentSegmentIdx]
        // 상태에 따라서 filteredCity 갱신
        filterCity(state: domesticTravel)
        
        cityCollectionView.reloadData() // 데이터 변경했으니 다시 로딩
        
        // 세그먼트가 클릭되면 서치바의 값이 바뀔떄 호출되는 함수를 다시 호출해야한다.
        searchBar(citySearchBar, textDidChange: citySearchBar.text!)
    }
    
    // 현재 세그먼트에 나와야 할 모든 CityList 저장
    func filterCity(state: TravelLocation) {
        if state == .local {
            filterdCity = city.filter({$0.domestic_travel})
        } else if state == .abroad {
            filterdCity = city.filter({!$0.domestic_travel})
        } else {
            filterdCity = city
        }
    }
    
    /// 받은 스트링을 ,와 공백 빼고 다시 문자열로 반환하는 함수
    func duplicateComma(string: String) -> String {
        // 공백이 2칸 이상이어도 separator에서 잘 걸러준다
        let newString = string.split(separator: [",", " "]).joined() // 배열 반환
        print("string: \(string)")
        print("newString: \(newString)")
        return newString // 공백이 있으면 제거해서 반환
    }
}

extension CityViewController: ViewProtocol {
    /// 뷰 초기 구성
    func configureView() {
        filterdCity = city
        citySearchBar.delegate = self
    }
}

// UI 요소들
extension CityViewController: CollectionViewControllerSetting {
    /// xib, register
    func collectionViewRegister() {
        // 다른 collectionView에서도 쓰일 것 같아서 Extension으로 따로 뺴줌
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        cityCollectionView.settingXib(collectionViewCellIdentifier: CityReuseCollectionViewCell.identifier)
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

}

extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterdCity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityReuseCollectionViewCell.identifier, for: indexPath) as! CityReuseCollectionViewCell
        
        cell.configureCell(data: filterdCity[indexPath.item], cellWidth: width)
        return cell
        
    }
    // 컬렌션셀이 눌렸을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
        let sb = UIStoryboard(name: "TravelInfo", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: TravelInfoViewController.identifier) as! TravelInfoViewController

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

// 서치바 관련 메서드
extension CityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            // 문자열이 ""이 되면 처음의 상태로 다시 되돌려 주기
            filterCity(state: domestic[currentSegmentIdx])
            cityCollectionView.reloadData()
            return
        }
        filterCity(state: domestic[currentSegmentIdx]) // filteredCity가 다시 설정된다.(바로 아래 코드에서 잘 작동할 수 있게 된다.)
        // 만약 위의 코드가 없다면 어떤 세그먼트에 계속 있는 상태에서 문자열의 변화를 줬을 때 이전 검색기록에서 다시 필터를 하기 떄문에
        // 태초의 상태로 돌려주어야 한다.
        let text = searchText.split(separator: [",", " "]).joined().trimmingCharacters(in: .whitespaces).lowercased()
        
        // 대소문자, 사이 공백, 양쪽 공백, 콤마 고려하지 않는뎅..
        filterdCity = filterdCity.filter{"\($0.city_name.lowercased()) + \($0.city_english_name.lowercased()) + \(duplicateComma(string: $0.city_explain).lowercased())".trimmingCharacters(in: .whitespaces).contains(text)}
        
        cityCollectionView.reloadData()
    }
}
