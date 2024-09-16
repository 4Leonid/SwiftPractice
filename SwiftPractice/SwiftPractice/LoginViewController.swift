import UIKit

class LoginViewController: UIViewController {
  
  private let customView = LoginView()
  
  private let email = "Leo"
  private let password = "1234"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
    setupUI()
    configureSubviews()
    setupConstraints()
  }
}

extension LoginViewController {
  func checkAuth(email: String, password: String) {
    if Validator.validateEmail(email: email) && Validator.validatePassword(password: password) {
      print("You data is correct")
    } else {
      print("You data is wrong?")
    }
  }
}

//  MARK: - Set Views and Constraints
extension LoginViewController {
  func setupUI() {
    customView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    view.addSubview(customView)
  }
  
  func setupConstraints() {
    
    NSLayoutConstraint.activate([
      customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
      customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  func setDelegates() {
    customView.delegate = self 
  }
}

