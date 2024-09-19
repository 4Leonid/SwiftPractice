import UIKit

final class TabBarController: UITabBarController {
  
  // MARK: - Private Properties
  private var isLogged = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
  }
  
  // MARK: - For login View
//  override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//    if !isLogged {
//      showLogin()
//      isLogged = true
//    }
//    print("\(#function)")
//  }
}

// MARK: - Actions
extension TabBarController {
  private func showLogin() {
    
    let loginVC = LoginViewController()
    loginVC.modalPresentationStyle = .fullScreen
    present(loginVC, animated: true)
  }
}

// MARK: - Private Actions
private extension TabBarController {
  func setupTabBar() {
    let firstVC = WelcomeViewController()
    let secondVC = SecondViewController()
    
    
    
    viewControllers = [
      createController(
        controller: firstVC,
        imageName: "hand.raised.fingers.spread",
        itemTitle: "Welcome",
        navigationTitle: "Welcome"),
      
      createController(
        controller: secondVC,
        imageName: "popcorn",
        itemTitle: "Movies",
        navigationTitle: "Movies")
    ]
  }
  
  func createController(
    controller: UIViewController,
    imageName: String,
    itemTitle: String,
    navigationTitle: String
  ) -> UINavigationController {
    controller.navigationItem.title = navigationTitle
    let navigationController = UINavigationController(rootViewController: controller)
    navigationController.tabBarItem = .init(
      title: itemTitle,
      image: UIImage(systemName: imageName),
      tag: 0
    )
    
    return navigationController
  }
}

