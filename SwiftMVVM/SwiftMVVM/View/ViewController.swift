//
//  ViewController.swift
//  SwiftMVVM
//
//  Created by SeongJoon Kim on 2020/07/15.
//  Copyright © 2020 SeongJoon Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    var viewModel:ViewModelProtocol!{
        didSet{
            self.viewModel.videosDidChanged = { [weak self] viewModel in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MVVM Table"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "추가", style: UIBarButtonItem.Style.plain, target: self, action: #selector(onAdd))

        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel = ViewModel()
    }
    
    @objc func onAdd(){
        viewModel.addVideo()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.videos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = viewModel.videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell")!
        cell.textLabel?.text = video.videoTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = viewModel.videos[indexPath.row]
        print(video.videoTitle)
    }
    
    
}
