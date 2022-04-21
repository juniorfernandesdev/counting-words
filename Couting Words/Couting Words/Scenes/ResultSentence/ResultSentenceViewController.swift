//
//  ResultSentenceViewController.swift
//  Couting Words
//
//  Created by Junior Fernandes on 21/04/22.
//

import UIKit

class ResultSentenceViewController: UIViewController {
    // MARK: - Strings
    private enum Strings {
        static let cellName = "MyCell"
    }
    
    // MARK: - Properties
    let sentence: String
    var result: [String] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Strings.cellName)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        countWords(with: sentence)
        
    }
    
    init(sentence: String) {
        self.sentence = sentence
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func countWords(with sentense: String) {
        let arr = sentense.split(separator: " ")
        let countss = arr.reduce(into:[:]) { countss, word in
            countss[word, default: 0] += 1
        }
        
        for word in countss {
            let name = word.key
            let qtd = word.value
            result.append("\(name) \(qtd)")
        }
    }
}

// MARK: - TableView DataSounce and Delegate
extension ResultSentenceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.cellName, for: indexPath as IndexPath)
        cell.textLabel!.text = "\(result[indexPath.row])"
        cell.selectionStyle = .none
        return cell
    }
}

private
extension ResultSentenceViewController {
    func setup() {
        configuraSubviews()
        view.backgroundColor = .white
    }
    
    func configuraSubviews() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
