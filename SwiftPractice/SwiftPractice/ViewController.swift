import UIKit

class ViewController: UIViewController {
  
  private let customView = CustomView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
  }
}

//  MARK: - Set Views and Constraints
extension ViewController {
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
}

