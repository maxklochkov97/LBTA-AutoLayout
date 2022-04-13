//
//  SwipingController+UICollectionView.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 13.04.2022.
//

import UIKit

extension SwipingController {
    // убираем отступы между блоками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        /* переделка в более безопасную версию
         let imageName = imageNames[indexPath.item]
         cell.bearFirstImage.image = UIImage(named: imageName)
         cell.descriptionTextView.text = headerStrings[indexPath.item]
         
         более безопасный вариант, но и он не финальный. Мы можем сделать лучше если вынесем все из Controller
         let page = pages[indexPath.item]
         cell.bearFirstImage.image = UIImage(named: page.imageName)
         cell.descriptionTextView.text = page.headerText
         */
        let page = pages[indexPath.item]
        cell.page = page
        
        
        // настраиваем цвет ячеек через один
        // cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    // Редактирование размера
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
