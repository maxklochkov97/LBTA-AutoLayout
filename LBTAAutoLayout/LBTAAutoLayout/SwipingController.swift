//
//  SwipControllering.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 08.04.2022.
//

import UIKit



class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {

    /* Это аварийный участок кода. Он работает, но уязвим к ошибкам. Ниже будет безопасная альтернатива.
    let imageNames = ["bear_first", "heart_second", "leaf_third"]
    let headerStrings = ["Join use today in our fun and games!"," Subscribe and get coupons on our daily events"," VIP members special services"]
    */

    let pages = [
        Page(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "")
    ]

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
