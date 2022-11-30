//
//  Cell.swift
//  Parser
//
//  Created by Zhanna Rolich on 18.11.2022.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    private let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = true

        return imageView
    }()
    
    private let newsName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: String(describing: NewsViewCell.self))
        
        setupView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(newsImage)
        self.addSubview(newsName)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            newsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            newsImage.heightAnchor.constraint(equalToConstant: 70),
            newsImage.widthAnchor.constraint(equalToConstant: 70),
            newsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            newsName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            newsName.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 10),
            newsName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
    }
    
}

