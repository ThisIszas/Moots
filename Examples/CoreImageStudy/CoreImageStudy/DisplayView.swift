//
//  DisplayView.swift
//  CoreImageStudy
//
//  Created by 黄伯驹 on 2019/2/14.
//  Copyright © 2019 黄伯驹. All rights reserved.
//

import UIKit

class DisplayView: UIView {

    private lazy var originalImageView: ContentView = {
        let imageView = ContentView()
        imageView.backgroundColor = UIColor(hex: 0xFF6369)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.text = "Original"
        return imageView
    }()
    
    private lazy var processedImageView: ContentView = {
        let imageView = ContentView()
        imageView.backgroundColor = UIColor(hex: 0xFF6369)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.text = "Processed"
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        let stackView = UIStackView(arrangedSubviews: [originalImageView, processedImageView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ContentView: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var text: String? {
        didSet {
            textLabel.text = text
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(white: 0.85, alpha: 1)
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont.boldSystemFont(ofSize: 48)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .white
        return textLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(textLabel)
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255
        let green = CGFloat((hex & 0xFF00) >> 8) / 255
        let blue = CGFloat(hex & 0xFF) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
