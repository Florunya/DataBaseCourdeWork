//
//  SelectTypeOfBeltViewController.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 05.12.2020.
//

import UIKit

class SelectTypeOfBeltViewController: UIViewController {
    
    let normalPoliklinButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Клиновый нормальный", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        btn.layer.borderColor = UIColor.systemBlue.cgColor
        btn.layer.borderWidth = 2
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(normalPoliklinButtonTapped), for: .touchUpInside)
        return btn
    }()

    let normalPolyklinSegmetnConstroll: UISegmentedControl = {
        let items = ["Пониженная передача", "Повышенная передача"]
        let seg = UISegmentedControl(items: items)
        seg.translatesAutoresizingMaskIntoConstraints = false
        return seg
    }()
    
    let slimPoliklinButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Клиновая узкая", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        btn.layer.borderColor = UIColor.systemBlue.cgColor
        btn.layer.borderWidth = 2
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(slimPoliklinButtonTapped), for: .touchUpInside)
        return btn
    }()

    let slimPolyklinSegmetnConstroll: UISegmentedControl = {
        let items = ["Пониженная передача", "Повышенная передача"]
        let seg = UISegmentedControl(items: items)
        seg.translatesAutoresizingMaskIntoConstraints = false
        return seg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Тип ремня"
        view.backgroundColor = .white
        [normalPoliklinButton, normalPolyklinSegmetnConstroll, slimPoliklinButton, slimPolyklinSegmetnConstroll].forEach{view.addSubview($0)}
        
        setConstraints()
    }
    
    func setConstraints(){
        normalPoliklinButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        normalPoliklinButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        normalPoliklinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        normalPoliklinButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        normalPolyklinSegmetnConstroll.topAnchor.constraint(equalTo: normalPoliklinButton.bottomAnchor, constant: 10).isActive = true
        normalPolyklinSegmetnConstroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        normalPolyklinSegmetnConstroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        normalPolyklinSegmetnConstroll.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        slimPoliklinButton.topAnchor.constraint(equalTo: normalPolyklinSegmetnConstroll.bottomAnchor, constant: 20).isActive = true
        slimPoliklinButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        slimPoliklinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        slimPoliklinButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        slimPolyklinSegmetnConstroll.topAnchor.constraint(equalTo: slimPoliklinButton.bottomAnchor, constant: 10).isActive = true
        slimPolyklinSegmetnConstroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        slimPolyklinSegmetnConstroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        slimPolyklinSegmetnConstroll.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
    @objc func normalPoliklinButtonTapped(){
        if normalPolyklinSegmetnConstroll.selectedSegmentIndex == -1{
            normalPoliklinButton.layer.borderColor = UIColor.systemRed.cgColor
            let alert = UIAlertController(title: "Внимание", message: "Выберите тип ремня", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Выбрать", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }else{
            normalPoliklinButton.layer.borderColor = UIColor.systemGreen.cgColor
            navigationController?.pushViewController(InputDataViewController(), animated: true)
        }
    }
    
    
    @objc func slimPoliklinButtonTapped(){
        if slimPolyklinSegmetnConstroll.selectedSegmentIndex == -1{
            slimPoliklinButton.layer.borderColor = UIColor.systemRed.cgColor
            let alert = UIAlertController(title: "Внимание", message: "Выберите тип ремня", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Выбрать", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }else{
            slimPoliklinButton.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
    
}
