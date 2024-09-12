//
//  CustomView.swift
//  SwiftPractice
//
//  Created by Леонид Турко on 12.09.2024.
//

import UIKit

class CustomView: UIView {
  
  private let titleLabel = UILabel()
  private let imageView = UIImageView()
  private let button = UIButton(type: .system)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Actions
extension CustomView {
  @objc func buttonTapped() {
    print("I am tapped")
  }
}

//  MARK: - Set Views and Constraints
private extension CustomView {
  func setupUI() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = "Hello world!!!"
    titleLabel.font = .systemFont(ofSize: 32)
    titleLabel.textAlignment = .center
    
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(resource: .deadpool)
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Push me", for: .normal)
    button.backgroundColor = .blue
    button.tintColor = .white
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
  
  func configureSubviews() {
    addSubviews([titleLabel, imageView, button])
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      //titleLabel.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: 24),
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
      trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 3),
      
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 200),
      imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
      
      button.centerXAnchor.constraint(equalTo: centerXAnchor),
      button.centerYAnchor.constraint(equalTo: centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 200),
      button.heightAnchor.constraint(equalToConstant: 60),
      
    ])
  }
}
