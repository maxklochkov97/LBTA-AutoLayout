//
//  ViewController.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 07.04.2022.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var secondPick = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

class ViewController: UIViewController {

    // Получение и настройка image
    let bearFirstImage: UIImageView = {
        let image = UIImage(named: "bear_first")
        let imageView = UIImageView(image: image)

        // позволяет корректно добавить констрейны к картинке
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // позволяет при изменении экрана сохранять пропорции (но вроде сразу все ок было)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    // Создание кнопки назад и вперед
    private let previouslyBotton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let nextBotton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .secondPick
        pc.currentPageIndicatorTintColor = .mainPink
        return pc
    }()

    // Получение и настройка TextView
    let descriptionTextView: UITextView = {
        let textView = UITextView()

        /* это фиксированная версия текста
        textView.text = "Join us today in our fun and games!"
        textView.font = .boldSystemFont(ofSize: 18)
        */

        // это адаптивная версия текста.
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!",
                                                       attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                                                 attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                                                              NSAttributedString.Key.foregroundColor: UIColor.gray]))

        textView.attributedText = attributedText

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Добавление image и text на view
        // view.addSubview(bearFirstImage)
        view.addSubview(descriptionTextView)
        setupBottonControls()
        setupLayout()
    }


    fileprivate func setupBottonControls(){

        // view.addSubview(previouslyBotton) - убрано, так как добавим в стек.

        // Задан фрейм кнопки, чтобы разместить ее фиксированно в определенной точке.
        // previouslyBotton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)

        let bottomControlsStackView = UIStackView(arrangedSubviews: [previouslyBotton, pageControl, nextBotton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        // позволит расположить элементы поровну внутри стека.
        bottomControlsStackView.distribution = .fillEqually
        // позволяет менять ориентацию стека (на вертикальный)
        // bottomControlsStackView.axis = .vertical
        view.addSubview(bottomControlsStackView)

        // Создание констрейн без указания isActive
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // Добавление констрейнов к image
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
//        topImageContainerView.backgroundColor = .blue
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false

        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

        /* это пример закрепления левого и правого якоря.
        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        */

        // Это аналогичный коду выше способ, apple рекомендует его. Так как он учитывает какая сторона начинающая, а какая заканчивающая. В арабском например все будет наоборот.
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        // Задан якорь высоты в половину экрана.
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

        // Добавлен image на topImageContainerView
        topImageContainerView.addSubview(bearFirstImage)

        bearFirstImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearFirstImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearFirstImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true

        /* этот код был убран, так как bearFirstImage был добавлен в topImageContainerView
        bearFirstImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bearFirstImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        bearFirstImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearFirstImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        */

        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

