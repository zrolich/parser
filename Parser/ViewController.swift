//
//  ViewController.swift
//  Parser
//
//  Created by Zhanna Rolich on 18.11.2022.
//

import UIKit
import ObjectMapper
import Alamofire
import Kingfisher
import AlamofireObjectMapper



class ViewController: UIViewController {
    
    var newsArray = [Article]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(NewsViewCell.self, forCellReuseIdentifier: String(describing: NewsViewCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupDelegate()
        setConstraints()
        
        self.getJSONFromAPI {
            print ("Downloaded")
            self.tableView.reloadData()
        }
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getJSONFromAPI(completion: @escaping GetComplete) {
        
        Alamofire.request(apiURL,method: .get, encoding: JSONEncoding.default).responseObject{(response: DataResponse<AllNewsDetails>) in
            
            if let newArticles = (response.result.value?.articles){
                self.newsArray = newArticles
            }
            
            completion()
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsViewCell.self), for: indexPath) as! NewsViewCell
        
        cell.textLabel?.text = newsArray[indexPath.row].title
        
        if let url = newsArray[indexPath.row].urlToImage  {
            let imageURL = URL(string: url)
            cell.imageView?.kf.setImage(with: imageURL, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { result in
                cell.setNeedsLayout()
            })
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}
