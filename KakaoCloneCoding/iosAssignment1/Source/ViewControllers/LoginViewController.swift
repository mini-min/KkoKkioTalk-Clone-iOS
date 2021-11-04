//
//  LoginViewController.swift
//  꼬끼오톡
//
//  Created by 민 on 2021/10/16.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction Properties
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        self.makeRequestAlert(title: "알림",
                              message: "로그인을 하시겠습니까?",
                              okAction: { _ in
            self.loginAction()
        })
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let pushVC = UIStoryboard(name: Const.Storyboard.Name.signUp, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.signUpViewController)
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func loginAction() {
        LoginService.shared.login(email: self.idTextField.text!, password: self.pwTextField.text!) { result in
            switch result {
            case .success(let message):
                if let message = message as? String {
                    self.makeAlert(title: "알림", message: message, okAction: { _ in
                        let nextVC = UIStoryboard(name: Const.Storyboard.Name.tabBar, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.tabBarViewController)
                        nextVC.modalPresentationStyle = .overFullScreen
                        self.present(nextVC, animated: true, completion: nil)
                    })
                }
            case .requestErr(let message):
                if let message = message as? String {
                    self.makeAlert(title: "알림", message: message)
                }
            default:
                print("ERROR")
            }
        }
    }
    
}

extension LoginViewController {
    func makeRequestAlert(title: String,
                          message: String,
                          okAction: ((UIAlertAction) -> Void)?,
                          cancelAction: ((UIAlertAction) -> Void)? = nil,
                          completion: (() -> Void)? = nil) {
        let genetator = UIImpactFeedbackGenerator(style: .medium)
        genetator.impactOccurred()
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func makeAlert(title: String,
                   message: String,
                   okAction: ((UIAlertAction) -> Void)? = nil,
                   completion: (() -> Void)? = nil) {
        let genetator = UIImpactFeedbackGenerator(style: .medium)
        genetator.impactOccurred()
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
