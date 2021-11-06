//
//  AddFriendViewController.swift
//  꼬끼오톡
//
//  Created by 민 on 2021/11/05.
//

import UIKit
import Alamofire

class AddFriendViewController: UIViewController {

    // MARK: - IBOutlet Properties
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuHeightConstaint: NSLayoutConstraint!
    
    @IBOutlet weak var QRCodeButton: UIButton!
    @IBOutlet weak var addPhoneButton: UIButton!
    @IBOutlet weak var addIDButton: UIButton!
    @IBOutlet weak var recommendButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        cellExpand()
    }

    // MARK: - IBAction Properties
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Functions
    func cellExpand() {
        UIView.animate(withDuration: 0.1) {
            self.menuHeightConstaint.constant = 73
            self.view.layoutIfNeeded()
            
            self.QRCodeButton.tintColor = .black
            self.addPhoneButton.tintColor = .black
            self.addIDButton.tintColor = .black
            self.recommendButton.tintColor = .black
        }
    }
    
}
