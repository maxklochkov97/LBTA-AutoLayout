//
//  PageCell.swift
//  LBTAAutoLayout
//
//  Created by Максим Клочков on 08.04.2022.
//

import UIKit

class PageCell: UICollectionViewCell {

    var page: Page? {
        didSet {
            // print(page?.imageName)
            guard let unwrappedPage = page else { return }
            bearFirstImage.image = UIImage(named: unwrappedPage.imageName)

            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

            attributedText.append(NSAttributedString(string: "\n\n\n \(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.gray]))

            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }

    private let bearFirstImage: UIImageView = {
        let image = UIImage(named: "bear_first")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let descriptionTextView: UITextView = {
        let textView = UITextView()

        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                                                 attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                                                              NSAttributedString.Key.foregroundColor: UIColor.gray]))

        textView.attributedText = attributedText
        textView.font = .boldSystemFont(ofSize: 18)
        textView.textColor = .black

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupLayout()
    }

    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false

        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true

        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true

        topImageContainerView.addSubview(bearFirstImage)

        bearFirstImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearFirstImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearFirstImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true

        addSubview(descriptionTextView)
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
