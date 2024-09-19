import UIKit

final class SecondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
  }
  
  override func loadView() {
    super.loadView()
    print("\(#function)")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("\(#function)")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("\(#function)")
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print("\(#function)")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print("\(#function)")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("\(#function)")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("\(#function)")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    print("\(#function)")
  }
  
  deinit {
    print("SEcond is out")
    print("\(#function)")
  }
}
