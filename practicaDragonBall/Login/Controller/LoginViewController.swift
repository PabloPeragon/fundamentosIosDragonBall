//
//  LoginViewController.swift
//  practicaDragonBall
//
//  Created by Pablo Jesús Peragón Garrido on 12/1/24.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Model
    private let model = NetworkModel.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    @IBAction func didTapContinueButton(_ sender: Any) {
        model.login(
            user: emailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        ) { [weak self] result in
            guard let self else { return}
            switch result {
            case let .success(token):
                DispatchQueue.main.async {
                    let heroesListTableViewController = HeroesListTableViewController();                 self.navigationController?.setViewControllers([heroesListTableViewController], animated: true)
                }
                
            case let .failure(error):
                print("🔴 \(error)")
            }
        }
    }
}
