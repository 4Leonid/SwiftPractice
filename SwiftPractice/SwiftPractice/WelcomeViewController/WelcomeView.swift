import UIKit

class WelcomeView: UIView {
  
  weak var delegate: WelcomeViewController?
  
  // MARK: - UIElements
  private let moreStackView = UIStackView()
  private let textField = UITextField()
  private let sendButton = UIButton(type: .system)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .yellow
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Actions
extension WelcomeView {
  @objc func sendButtonTapped() {
    let detailVC = DetailViewController()
    guard let text = textField.text else { return }
    detailVC.updateText(with: text)
    //delegate?.navigationController?.pushViewController(detailVC, animated: true)
    delegate?.showViewController(detailVC)
  }
}

//  MARK: - Set Views and Constraints
private extension WelcomeView {
  func setupUI() {
    moreStackView.translatesAutoresizingMaskIntoConstraints = false
    moreStackView.axis = .vertical
    moreStackView.spacing = 10
    moreStackView.distribution = .fillEqually
    
    textField.placeholder = "Enter the text"
    textField.borderStyle = .roundedRect
    
    sendButton.setTitle("Send", for: .normal)
    sendButton.backgroundColor = .blue
    sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
  }
  
  func configureSubviews() {
    moreStackView.addArrangedSubview(textField)
    moreStackView.addArrangedSubview(sendButton)
    
    addSubview(moreStackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      moreStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      moreStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
