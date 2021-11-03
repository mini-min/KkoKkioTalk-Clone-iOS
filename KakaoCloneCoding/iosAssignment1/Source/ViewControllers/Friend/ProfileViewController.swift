//
//  ProfileViewController.swift
//  꼬끼오톡
//
//  Created by 민 on 2021/10/16.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlet Properties
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - Properties
    var initialTouchPoint = CGPoint(x: 0, y: 0)
    
    var image: String = ""
    var profile: String = ""
    var message: String = ""

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setPanGesture()
    }
    
    // MARK: - IBAction Properties
    // 상단 x버튼 클릭 시
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 나와의 채팅 버튼 클릭 시
    @IBAction func myChatButtonClicked(_ sender: Any) {
    }
    
    // 프로필 편집 버튼 클릭 시
    @IBAction func editButtonClicked(_ sender: Any) {
    }
    
    // 카카오스토리 버튼 클릭 시
    @IBAction func kakaoStoryButtonClicked(_ sender: Any) {
    }
    
    // MARK: - Functions
    func getData() {
        self.titleLabel.text = profile
        self.messageLabel.text = message
        
        if let image = UIImage(named: image) {
            self.profileImageView.image = image
        }
    }
    
    func setPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureDismiss(_:)))
        self.view.addGestureRecognizer(panGesture)
    }
    
    @objc func panGestureDismiss(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view.window)
        
        if sender.state == .began {
            initialTouchPoint = touchPoint
        } else if sender.state == .changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.width, height: self.view.frame.height)
            }
        } else if sender.state == .ended || sender.state == .cancelled {
            if touchPoint.y - initialTouchPoint.y > 200 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                }
            }
        }
    }
}
