//
//  ResultViewController.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultTableView: UITableView!
    
    private var resultViewModel: ResultViewModel
    private let playgroundVCInstance : PlaygroundViewController
    
    init(_ resultViewModel: ResultViewModel, _ playGround: PlaygroundViewController) {
        self.resultViewModel = resultViewModel
        self.playgroundVCInstance = playGround
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView() {
        
        resultTableView.sectionHeaderTopPadding = 0.0
        resultTableView.register(UINib(nibName: ResultTableViewCell.key, bundle: nil), forCellReuseIdentifier: ResultTableViewCell.key)
        resultTableView.register(UINib(nibName: ResultTableViewHeader.key, bundle: nil), forHeaderFooterViewReuseIdentifier: ResultTableViewHeader.key)
        
        resultTableView.dataSource = self
        resultTableView.delegate = self
    }
    
    @IBAction func restartAction(_ sender: Any) {
        SoundHandler.shared.playSound(.click)
        playgroundVCInstance.viewDidAppear(true)
        self.dismiss(animated: true)
    }
    
    @IBAction func exitAction(_ sender: Any) {
        SoundHandler.shared.playSound(.click)
        exit(0)
    }
}

//MARK: - TableView DataSource, Delegate
extension ResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(resultViewModel.getCount())
        return resultViewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.key) as! ResultTableViewCell
        cell.config(resultViewModel.getWordPairViewModel(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: ResultTableViewHeader.key) as! ResultTableViewHeader
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
