//
//  MainTableViewCell.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 04.12.2020.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        return scroll
    }()

    let gearNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Номер передачи"
        lbl.numberOfLines = 0
        lbl.font = lbl.font.withSize(20)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let gearNumberValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "1"
        lbl.numberOfLines = 0
        lbl.font = lbl.font.withSize(50)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let highSpeedShaftTorque: UILabel = {
        let lbl = UILabel()
        lbl.text = "Крутящий момент на быстроходном валу: 300"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //MARK: -Inits
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        scrollView.contentSize = CGSize(width: contentView.frame.width + 1000, height: 0)
        contentView.addSubview(scrollView)
        [gearNumberLabel, gearNumberValueLabel ,highSpeedShaftTorque].forEach{self.scrollView.addSubview($0)}
        
        setConstraints()
        
    }
    
    //MARK: - SetUpConstraints
    
    func setConstraints(){
        
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        gearNumberLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        gearNumberLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        gearNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        gearNumberLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        gearNumberValueLabel.topAnchor.constraint(equalTo: gearNumberLabel.bottomAnchor,constant: 10).isActive = true
        gearNumberValueLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        gearNumberValueLabel.leadingAnchor.constraint(equalTo: gearNumberLabel.leadingAnchor).isActive = true
        gearNumberValueLabel.trailingAnchor.constraint(equalTo: gearNumberLabel.trailingAnchor).isActive = true
     
        highSpeedShaftTorque.topAnchor.constraint(equalTo: gearNumberLabel.topAnchor).isActive = true
        highSpeedShaftTorque.leadingAnchor.constraint(equalTo: gearNumberLabel.trailingAnchor, constant: 30).isActive = true
        highSpeedShaftTorque.widthAnchor.constraint(equalToConstant: 1000).isActive = true
        highSpeedShaftTorque.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
}
