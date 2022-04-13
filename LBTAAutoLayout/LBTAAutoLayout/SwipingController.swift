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
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: ""),

        Page(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "")
    ]

    // Создание кнопки назад и вперед
    private let previouslyBotton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePreviously), for: .touchUpInside)
        return button
    }()

    @objc private func handlePreviously() {
        let previouslyPage = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: previouslyPage, section: 0)
        pageControl.currentPage = previouslyPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    private let nextBotton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()

    @objc private func handleNext() {
        let nextPage = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .secondPick
        pc.currentPageIndicatorTintColor = .mainPink
        return pc
    }()

    fileprivate func setupBottonControls(){

        let bottomControlsStackView = UIStackView(arrangedSubviews: [previouslyBotton, pageControl, nextBotton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // чтобы при прокрутке пальцем значение точек тоже менялось.
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
  
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBottonControls()

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
