import UIKit

final class WelcomeViewController: UIViewController {
  
  // MARK: - Private Properties
  private lazy var welcomeView = WelcomeView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
    setDelegates()
  }
}

//  MARK: - Set Views and Constraints
extension WelcomeViewController {
  func setupUI() {
    welcomeView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    view.addSubview(welcomeView)
  }
  
  func setupConstraints() {
    welcomeView.edgesToSuperview()
    NSLayoutConstraint.activate([
      
    ])
  }
  
  func setDelegates() {
    welcomeView.delegate = self 
  }
}
