//
//  CustomView.swift
//  SwiftPractice
//
//  Created by Леонид Турко on 12.09.2024.
//

import UIKit

class LoginView: UIView {
  
  // MARK: - UIElements
  private let appImage = UIImageView()
  let loginButton = UIButton(type: .system)
  
  private var vLabelStackView = UIStackView()
  private var vTextFieldStackView = UIStackView()
  private var hStackView = UIStackView()
  
  private let appLabel = UILabel()
  private let loginLabel = UILabel()
  private let passwordLabel = UILabel()
  
  private let loginTextField = UITextField()
  private let passwordTextField = UITextField()
  
  weak var delegate: LoginViewController?
  
  init(delegate: LoginViewController? = nil) {
    self.delegate = delegate
    super.init(frame: .zero)
    setupUI()
    configureSubviews()
    setupConstraints()
    makeNotification()
  }
  
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    
//    setupUI()
//    configureSubviews()
//    setupConstraints()
//    
//    makeNotification()
//  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Deinit
  deinit {
    print("viewcontroller is out")
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }
}

// MARK: - Keyboard settings
extension LoginView {
  func makeNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  func adjustButtonForKeyboard(height: CGFloat) {
    UIView.animate(withDuration: 0.3) {
      self.loginButton.transform = CGAffineTransform(translationX: 0, y: -height)
    }
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keyboardHeight = keyboardFrame.cgRectValue.height
      adjustButtonForKeyboard(height: keyboardHeight * 0.1)
    }
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    adjustButtonForKeyboard(height: -40)
  }
}

// MARK: - Actions
extension LoginView {
  @objc func buttonTapped() {
    let email = loginTextField.text ?? ""
    let password = passwordTextField.text ?? ""
    delegate?.checkAuth(email: email, password: password)
  }
}

//  MARK: - Set Views and Constraints
private extension LoginView {
  func setupUI() {
    // Horisontal Stack View
    hStackView.translatesAutoresizingMaskIntoConstraints = false
    hStackView.axis = .horizontal
    hStackView.distribution = .fill
    hStackView.spacing = 5
    
    // Vertical Title Stack View
    vLabelStackView.translatesAutoresizingMaskIntoConstraints = false
    vLabelStackView.axis = .vertical
    vLabelStackView.distribution = .fillEqually
    vLabelStackView.spacing = 5
    
    // Vertical Author Stack View
    vTextFieldStackView.translatesAutoresizingMaskIntoConstraints = false
    vTextFieldStackView.axis = .vertical
    vTextFieldStackView.distribution = .fillEqually
    vTextFieldStackView.spacing = 5
    
    
    appLabel.translatesAutoresizingMaskIntoConstraints = false
    appLabel.text = "Practice"
    appLabel.font = .systemFont(ofSize: 32)
    appLabel.textAlignment = .center
    
    // App Image
    appImage.translatesAutoresizingMaskIntoConstraints = false
    appImage.image = UIImage(resource: .deadpool)
    appImage.contentMode = .scaleAspectFill
    appImage.layer.cornerRadius = 16
    appImage.clipsToBounds = true
    
    // Login Label
    loginLabel.translatesAutoresizingMaskIntoConstraints = false
    loginLabel.numberOfLines = 0
    loginLabel.text = "Login"
    loginLabel.font = .preferredFont(forTextStyle: .body)
    
    // Password Label
    passwordLabel.translatesAutoresizingMaskIntoConstraints = false
    passwordLabel.numberOfLines = 0
    passwordLabel.text = "Password"
    passwordLabel.font = .preferredFont(forTextStyle: .body)
    
    // Login TextField
    loginTextField.translatesAutoresizingMaskIntoConstraints = false
    loginTextField.borderStyle = .roundedRect
    
    // Password TextField
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.isSecureTextEntry = true
    passwordTextField.borderStyle = .roundedRect
    
    // Login Button
    loginButton.translatesAutoresizingMaskIntoConstraints = false
    loginButton.setTitle("Push me", for: .normal)
    loginButton.backgroundColor = .darkGray
    loginButton.tintColor = .red
    loginButton.layer.cornerRadius = 16
    loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
  
  func configureSubviews() {
    vLabelStackView.addArrangedSubview(loginLabel)
    vLabelStackView.addArrangedSubview(passwordLabel)
    
    vTextFieldStackView.addArrangedSubview(loginTextField)
    vTextFieldStackView.addArrangedSubview(passwordTextField)
    
    hStackView.addArrangedSubview(vLabelStackView)
    hStackView.addArrangedSubview(vTextFieldStackView)
    
    addSubviews([appLabel, appImage, hStackView, loginButton])
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      appLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
      appLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
      trailingAnchor.constraint(equalToSystemSpacingAfter: appLabel.trailingAnchor, multiplier: 3),
      
      appImage.topAnchor.constraint(equalToSystemSpacingBelow: appLabel.bottomAnchor, multiplier: 3),
      appImage.centerXAnchor.constraint(equalTo: centerXAnchor),
      appImage.heightAnchor.constraint(equalToConstant: 200),
      appImage.widthAnchor.constraint(equalTo: appImage.heightAnchor),
      
      hStackView.topAnchor.constraint(equalTo: appImage.bottomAnchor, constant: 30),
      hStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      hStackView.heightAnchor.constraint(equalToConstant: 65),
      hStackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -40),
      hStackView.widthAnchor.constraint(equalTo: appImage.widthAnchor),
  
      loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      loginButton.widthAnchor.constraint(equalTo: hStackView.widthAnchor),
      loginButton.heightAnchor.constraint(equalTo: hStackView.heightAnchor, multiplier: 0.5),
    ])
  }
}
