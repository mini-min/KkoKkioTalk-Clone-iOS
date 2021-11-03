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
        let nextVC = UIStoryboard(name: Const.Storyboard.Name.tabBar, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.tabBarViewController)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let pushVC = UIStoryboard(name: Const.Storyboard.Name.signUp, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.signUpViewController)
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
}
