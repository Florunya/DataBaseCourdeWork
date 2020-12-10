//
//  ShowMormalizeTableViewController.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 09.12.2020.
//

import UIKit

class ShowNormalizeTableViewController: UIViewController {

    let table: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.backgroundColor = .white
        [table].forEach{view.addSubview($0)}
        setConstraints()
        
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
extension ShowNormalizeTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
//            present(Table1ViewController(), animated: true, completion: nil)
            self.navigationController?.pushViewController(Table1ViewController(), animated: true)
        case 1:
//            present(Table2ViewController(), animated: true, completion: nil)
            self.navigationController?.pushViewController(Table2ViewController(), animated: true)
        case 2:
//            present(Table3ViewController(), animated: true, completion: nil)
            self.navigationController?.pushViewController(Table3ViewController(), animated: true)
        case 3:
//            present(Table3ViewController(), animated: true, completion: nil)
            self.navigationController?.pushViewController(Table4ViewController(), animated: true)
        default:
            print("Error")
        }
    }
    
}

