import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - Private Properties
  private lazy var detailView = DetailView()
  private var text: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
  }
}

// MARK: - Actions
extension DetailViewController {
  func updateText(with text: String) {
    self.text = text
    detailView.updateLabel(with: text)
  }
}

//  MARK: - Set Views and Constraints
extension DetailViewController {
  func setupUI() {
    detailView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    view.addSubview(detailView)
  }
  
  func setupConstraints() {
    detailView.edgesToSuperview()
    NSLayoutConstraint.activate([
      
    ])
  }
}
