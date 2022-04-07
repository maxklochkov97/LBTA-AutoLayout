//
//  ViewController.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 07.04.2022.
//

import UIKit

class ViewController: UIViewController {

    // Получение и настройка image
    let bearFirstImage: UIImageView = {
        let image = UIImage(named: "bear_first")
        let imageView = UIImageView(image: image)
        // позволяет корректно добавить констрейны к картинке
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Получение и настройка TextView
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games!"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Добавление image и text на view
        view.addSubview(bearFirstImage)
        view.addSubview(descriptionTextView)
        setupLayout()
    }

    // Добавление констрейнов к image
    private func setupLayout() {
        bearFirstImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bearFirstImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        bearFirstImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearFirstImage.heightAnchor.constraint(equalToConstant: 200).isActive = true

        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: bearFirstImage.bottomAnchor, constant: 120).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

