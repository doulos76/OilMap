//
//  SettingController.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
  
  lazy var backdropView: UIView = {
    let bdView = UIView(frame: self.view.bounds)
    bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    return bdView
  }()
  
  lazy var headerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.red
    return view
  }()
  
  lazy var headerViewtitleLabel: UILabel = {
    let label = UILabel()
    label.text = "설정(Settings)"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    label.backgroundColor = .blue
    label.translatesAutoresizingMaskIntoConstraints = true
    return label
  }()
  
  lazy var headerViewcloseButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "iconMenuArrowDown"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = true
    button.backgroundColor = .green
    return button
  }()
  
  
  
  let tableView = UITableView()
  let tableViewHeight = UIScreen.main.bounds.height * 0.65 /// 2
  var isPresenting = false
  
  init() {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .custom
    transitioningDelegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let cellId = "cellId"
  let sectionItems = ["반경", "유종선택", "검색 상표 입력", "카드 할인 입력"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .clear
    view.addSubview(backdropView)
    view.addSubview(headerView)
    view.addSubview(tableView)
    
    headerView.addSubview(headerViewtitleLabel)
    headerView.addSubview(headerViewcloseButton)
    
    headerViewtitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
    headerViewtitleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8).isActive = true
    headerViewtitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    headerViewtitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    headerViewcloseButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 16).isActive = true
    headerViewcloseButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8).isActive = true
    headerViewcloseButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    headerViewcloseButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    
    tableView.dataSource = self
    tableView.delegate = self
    
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    headerView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.heightAnchor.constraint(equalToConstant: tableViewHeight).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    tableView.register(RadiusCell.self, forCellReuseIdentifier: cellId)
    setupNavigationController()
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleClose))
    view.addGestureRecognizer(panGesture)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingController.handleClose))
    view.addGestureRecognizer(tapGesture)
  }
  
  // MARK:- Setup Work
  fileprivate func setupNavigationController() {
    navigationItem.title = "Settings"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenuArrowDown")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleClose))
  }
  
  @objc func handleClose() {
    dismiss(animated: true, completion: nil)
  }
}

extension SettingController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionItems.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let sectionTitle = sectionItems[section]
    title = sectionTitle
    return title
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView()
//    view.backgroundColor = .white
    return view
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RadiusCell
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
}

extension SettingController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }

  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 1
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
    guard let toVC = toViewController else { return }
    isPresenting = !isPresenting

    if isPresenting == true {
      containerView.addSubview(toVC.view)

      headerView.frame.origin.y += tableViewHeight + 100

      tableView.frame.origin.y += tableViewHeight
      backdropView.alpha = 0

      UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
        self.headerView.frame.origin.y -= self.tableViewHeight + 100
        self.tableView.frame.origin.y -= self.tableViewHeight
        self.backdropView.alpha = 1
      }) { (finished) in
        transitionContext.completeTransition(true)
      }
    } else {
      UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
        self.headerView.frame.origin.y += self.tableViewHeight + 100
        self.tableView.frame.origin.y += self.tableViewHeight
        self.backdropView.alpha = 0
      }) { (finished) in
        transitionContext.completeTransition(true)
      }
    }
  }
}
