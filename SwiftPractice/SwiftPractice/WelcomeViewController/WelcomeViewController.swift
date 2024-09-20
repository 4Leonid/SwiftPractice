import UIKit

final class WelcomeViewController: UIViewController {
  
  // MARK: - Private Properties
  private lazy var welcomeView = WelcomeView()
  private var text: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
    setDelegates()
  }
}

extension WelcomeViewController: WelcomeViewDelegate {
  func show(_ viewController: UIViewController) {
    navigationController?.pushViewController(viewController, animated: true)
  }
}

// MARK: - Actions
extension WelcomeViewController {
  func showViewController(_ vc: UIViewController) {
    navigationController?.pushViewController(vc, animated: true)
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
