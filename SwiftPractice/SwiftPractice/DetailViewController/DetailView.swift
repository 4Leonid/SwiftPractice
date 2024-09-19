import UIKit

protocol DetailViewProtocol {
  func updateLabel(with text: String)
}

class DetailView: UIView {
  
  private let textLabel = UILabel()
  
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

// MARK: - SendViewProtocol
extension DetailView: DetailViewProtocol {
  func updateLabel(with text: String) {
    textLabel.text = text
  }
}


//  MARK: - Set Views and Constraints
private extension DetailView {
  func setupUI() {
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    textLabel.text = "I am here"
  }
  
  func configureSubviews() {
    addSubview(textLabel)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
