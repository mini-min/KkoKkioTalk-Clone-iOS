//
//  SignUpViewController.swift
//  꼬끼오톡
//
//  Created by 민 on 2021/10/16.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - IBOutlet Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction Properties
    @IBAction func makeAccountButtonClicked(_ sender: Any) {
        let nextVC = UIStoryboard(name: Const.Storyboard.Name.friend, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.friendViewController)
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
