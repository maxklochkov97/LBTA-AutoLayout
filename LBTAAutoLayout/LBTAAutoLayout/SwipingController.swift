//
//  SwipControllering.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 08.04.2022.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")

        collectionView.isPagingEnabled = true
    }

    // убираем отступы между блоками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        // настраиваем цвет ячеек через один
        // cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }

    // Редактирование размера
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
