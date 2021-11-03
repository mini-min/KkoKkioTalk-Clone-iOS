//
//  FriendViewController.swift
//  꼬끼오톡
//
//  Created by 민 on 2021/10/16.
//

import UIKit

class FriendViewController: UIViewController {

    // MARK: - IBOutlet Properties
    @IBOutlet weak var serviceTableView: UITableView!
    @IBOutlet weak var profileHeaderView: UIView!
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - Properties
    var friendList: [FriendListDataModel] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceTableView.tableHeaderView = profileHeaderView
        
        setFriendList()

        serviceTableView.delegate = self
        serviceTableView.dataSource = self
        serviceTableView.separatorStyle = .none
    }
    
    // MARK: - Functions
    func setFriendList() {
        friendList.append(contentsOf: [
            FriendListDataModel(imageName: "profileImage1",
                                name: "안솝트",
                                state: "배고파요"),
            
            FriendListDataModel(imageName: "profileImage2",
                                name: "최솝트",
                                state: "피곤해요"),
            
            FriendListDataModel(imageName: "profileImage3",
                                name: "정솝트",
                                state: "시험언제끝나죠?"),
            
            FriendListDataModel(imageName: "profileImage4",
                                name: "이솝트",
                                state: "ㅠㅠㅠㅠ"),
            
            FriendListDataModel(imageName: "profileImage5",
                                name: "유솝트",
                                state: "나는 상태메세지!"),
            
            FriendListDataModel(imageName: "profileImage6",
                                name: "박솝트",
                                state: "원하는대로 바꿔보세요 ^_^"),
            
            FriendListDataModel(imageName: "profileImage7",
                                name: "최솝트",
                                state: "넘 덥다.."),
            
            FriendListDataModel(imageName: "profileImage8",
                                name: "원솝트",
                                state: "배고파요"),
            
            FriendListDataModel(imageName: "profileImage9",
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
            
            FriendListDataModel(imageName: "profileImage10",
                                name: "권솝트",
                                state: "걱정말라구!")
        ])
    }
    
    // MARK: - IBAction Properties
    @IBAction func profileButtonClicked(_ sender: Any) {
        guard let nextVC = UIStoryboard(name: Const.Storyboard.Name.profile, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.profileViewController) as? ProfileViewController else { return }
        
        nextVC.modalPresentationStyle = .overFullScreen
        
        nextVC.image = ""
        nextVC.profile = self.nameLabel.text ?? ""
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func optionButton(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "편집", style: .default, handler: {_ in})
        let managementAction = UIAlertAction(title: "친구 관리", style: .default, handler: {_ in})
        let settingtAction = UIAlertAction(title: "전체 설정", style: .default, handler: {_ in})
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: {_ in})
        
        optionMenu.addAction(editAction)
        optionMenu.addAction(managementAction)
        optionMenu.addAction(settingtAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
}

// MARK: - Table View Delegate 
extension FriendViewController: UITableViewDelegate {
    // row 클릭 시 화면 전환
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = UIStoryboard(name: Const.Storyboard.Name.profile, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.profileViewController) as? ProfileViewController else { return }
        
        nextVC.modalPresentationStyle = .overFullScreen
        
        nextVC.image = friendList[indexPath.row].imageName
        nextVC.profile = friendList[indexPath.row].name
        nextVC.message = friendList[indexPath.row].state
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // Swipe Action으로 숨김, 차단 표시
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let hideAction = UIContextualAction(style: .normal, title: "숨김", handler: { (_ action, _ view, _ completionHandler) in
        })
        let banAction = UIContextualAction(style: .normal, title: "차단", handler: { (_ action, _ view, _ completionHandler) in
        })
        
        hideAction.backgroundColor = .gray
        banAction.backgroundColor = .red
        
        let swipeActions = UISwipeActionsConfiguration(actions: [banAction, hideAction])
        swipeActions.performsFirstActionWithFullSwipe = false
        
        return swipeActions
    }
    
    // Context Menu Configuration - cell 꾹 눌러서 미리보기
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: {
            let previewVC = UIStoryboard(name: Const.Storyboard.Name.profile, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Identifier.profileViewController) as? ProfileViewController
            
            previewVC?.image = self.friendList[indexPath.row].imageName
            previewVC?.profile = self.friendList[indexPath.row].name
            previewVC?.message = self.friendList[indexPath.row].state
            
            return previewVC
        }, actionProvider: {_ in
            let chatting = UIAction(title: "채팅하기") { _ in }
            let voiceTalk = UIAction(title: "보이스톡") { _ in }
            let faceTalk = UIAction(title: "페이스톡") { _ in }
            let gift = UIAction(title: "선물하기") { _ in }

            return UIMenu(title: "", children: [chatting,
                                               voiceTalk,
                                               faceTalk,
                                               gift])
        })
    }
}

// MARK: - Table View Data Source
extension FriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: FirstTabTableViewCell.identifier, for: indexPath)
                as? FirstTabTableViewCell else {return UITableViewCell() }
        
        serviceCell.setData(imageName: friendList[indexPath.row].imageName,
                            name: friendList[indexPath.row].name,
                            state: friendList[indexPath.row].state)
        
        return serviceCell
    }
}
