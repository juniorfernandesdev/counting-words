//
//  InputSentenceViewController.swift
//  Couting Words
//
//  Created by Junior Fernandes on 21/04/22.
//

import UIKit

class InputSentenceViewController: UIViewController {
    // MARK: - Strings
    private enum Strings {
        static let buttonName = "Continuar"
        static let sentenceText = "Insira uma frase no campo abaixo"
        static let logName = "logo"
    }
    
    // MARK: - Components
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Strings.logName)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = Strings.sentenceText
        return label
    }()
    
    private lazy var sentenceTextfield: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.keyboardType = UIKeyboardType.emailAddress
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 8
            textField.autocapitalizationType = .none
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
            textField.leftViewMode = .always
            return textField
        }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.buttonName, for: .normal   )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
        button.backgroundColor = .blue
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImage, sentenceLabel, sentenceTextfield, continueButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private
extension InputSentenceViewController {
    func setup() {
        configuraSubviews()
        view.backgroundColor = .white
    }
    
    func configuraSubviews() {
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        logoImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        sentenceTextfield.heightAnchor.constraint(equalToConstant: 45).isActive = true
        sentenceTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        sentenceTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        continueButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        continueButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        continueButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        sentenceLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70).isActive = true
        
    }
    
    @objc func nextStep() {
        let viewController = ResultSentenceViewController(sentence: sentenceTextfield.text ?? "")
        self.present(viewController, animated: true, completion: nil)
    }
}
