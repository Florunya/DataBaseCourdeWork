//
//  InputDataViewController.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 05.12.2020.
//

import UIKit

class InputDataViewController: UIViewController {
    
    /*
     *  Определение минимального диаметра шкифа (DP1) в 1 случае по таблице
     *  Долговечность ремня и кпд
     *  Если известно а то высчитывание по формуле (1)
     *  Если известно тб то по другой формуле
     */
    
    let formuls = Formuls()
    let constants = Constants()
    let model = AllData()
    let saveData = SaveData()
    var aRes: Float?
    var dp1Res: Float?
    var d2Res: Float?
    var remLength: Float?
    
    
    
    //Частота вращение меньшего шкифа
    let n1Label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Частота вращения меньшего шкифа, n1"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let n1TextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        return txt
    }()
    
    //Частота вращение большего шкифа
    let n2Label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Частота вращения большего шкифа, n2"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let n2TextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        return txt
    }()
    
    //Межосевое расстояние
    let aLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Межосевое расстояние, a"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let aTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        return txt
    }()
    
    //    Коэффициент скольжение
    let eLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Коэффициент скольжение, E"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let eTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        txt.keyboardType = .numberPad
        txt.addTarget(self, action: #selector(didEndInputETextField), for: .editingDidEnd)
        return txt
    }()
    
    let nLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Мощность, N"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let nTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        return txt
    }()
    
    let hLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Высота ремня, h"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let hTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        return txt
    }()
    
    let tLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Крутящий момент, Tб"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let tTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        return txt
    }()
    
    let qLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Коэфициент, Q"
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let qTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.systemBlue.cgColor
        txt.addTarget(self, action: #selector(qTextDieldDidEndEditing), for: .editingDidEnd)
        return txt
    }()
    
    let aResLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let purposeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Определение минимального допустимого диаметра для:"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let segmentControll: UISegmentedControl = {
        let items = ["Поликлинового ремня", "Увеличение долговечности и К.П.Д", "При известном межосевом расстоянии", "Для выбранного сечения и типа ремня"]
        let seg = UISegmentedControl(items: items)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.addTarget(self, action: #selector(segmentValueDidChange), for: .valueChanged)
        return seg
    }()
    
    let typeOfTransmissionSegmentControll: UISegmentedControl = {
        
        let items = ["Пониженная передача", "Повышенная передача"]
        let seg = UISegmentedControl(items: items)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.addTarget(self, action: #selector(typeOfTransmissionSegmentControllValueDidChange), for: .valueChanged)
        return seg
    }()
    
    let cipherOfBeltSegmentController: UISegmentedControl = {
        let items = ["О", "А", "Б", "В", "УО", "УА", "УБ", "УВ"]
        let seg = UISegmentedControl(items: items)
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.addTarget(self, action: #selector(typeOfBeltSegmentControllerValueDidChange), for: .valueChanged)
        return seg
    }()
    
    let d1Label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let d2Label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let roundedDP1Label:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let roundedDP2Label:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let remLengthLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let remRoundLengthLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let aFinalLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let vLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    let pLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Ввод данных"
        let button =  UIButton(type: .custom)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(saveItemTapped), for: .touchUpInside)
        button.frame = CGRect(x:0, y:0, width:32, height:32)
        let barButton = UIBarButtonItem(customView: button)
        
        let buttonInfo =  UIButton(type: .custom)
        buttonInfo.setTitle("Нормализованные таблицы", for: .normal)
        buttonInfo.setTitleColor(.black, for: .normal)
        buttonInfo.addTarget(self, action: #selector(NormalisedTableTapped), for: .touchUpInside)
        buttonInfo.frame = CGRect(x:0, y:0, width:32, height:32)
        let barButtoninfo = UIBarButtonItem(customView: buttonInfo)
        self.navigationItem.rightBarButtonItems = [barButton, barButtoninfo]
        
        self.view.backgroundColor = .white
        [n1Label, n1TextField, n2Label, n2TextField, aLabel, aTextField, eLabel, eTextField, nLabel, nTextField, hLabel, hTextField, tLabel, tTextField, segmentControll, purposeLabel, d1Label, typeOfTransmissionSegmentControll, cipherOfBeltSegmentController, d2Label, qLabel, qTextField, aResLabel, roundedDP1Label, roundedDP2Label, remLengthLabel, remRoundLengthLabel, aFinalLabel, vLabel, pLabel].forEach{self.view.addSubview($0)}
        setConstraints()
    }
    
    func setConstraints(){
        n1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        n1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        n1Label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        n1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        n1TextField.topAnchor.constraint(equalTo: n1Label.topAnchor).isActive = true
        n1TextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        n1TextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        n1TextField.heightAnchor.constraint(equalTo: n1Label.heightAnchor).isActive = true
        
        n2Label.topAnchor.constraint(equalTo: n1Label.bottomAnchor, constant: 30).isActive = true
        n2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        n2Label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        n2Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        n2TextField.topAnchor.constraint(equalTo: n2Label.topAnchor).isActive = true
        n2TextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        n2TextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        n2TextField.heightAnchor.constraint(equalTo: n2Label.heightAnchor).isActive = true
        
        aLabel.topAnchor.constraint(equalTo: n2Label.bottomAnchor, constant: 30).isActive = true
        aLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        aLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        aLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        aTextField.topAnchor.constraint(equalTo: aLabel.topAnchor).isActive = true
        aTextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        aTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        aTextField.heightAnchor.constraint(equalTo: aLabel.heightAnchor).isActive = true
        
        eLabel.topAnchor.constraint(equalTo: aLabel.bottomAnchor, constant: 30).isActive = true
        eLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        eLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        eLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        eTextField.topAnchor.constraint(equalTo: eLabel.topAnchor).isActive = true
        eTextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        eTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        eTextField.heightAnchor.constraint(equalTo: eLabel.heightAnchor).isActive = true
        
        nLabel.topAnchor.constraint(equalTo: eTextField.bottomAnchor, constant: 30).isActive = true
        nLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nTextField.topAnchor.constraint(equalTo: nLabel.topAnchor).isActive = true
        nTextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        nTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nTextField.heightAnchor.constraint(equalTo: eLabel.heightAnchor).isActive = true
        
        hLabel.topAnchor.constraint(equalTo: nTextField.bottomAnchor, constant: 30).isActive = true
        hLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        hLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        hLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        hTextField.topAnchor.constraint(equalTo: hLabel.topAnchor).isActive = true
        hTextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        hTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        hTextField.heightAnchor.constraint(equalTo: eLabel.heightAnchor).isActive = true
        
        tLabel.topAnchor.constraint(equalTo: hTextField.bottomAnchor, constant: 30).isActive = true
        tLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        tLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        tTextField.topAnchor.constraint(equalTo: tLabel.topAnchor).isActive = true
        tTextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        tTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        tTextField.heightAnchor.constraint(equalTo: eLabel.heightAnchor).isActive = true
        
        qLabel.topAnchor.constraint(equalTo: tTextField.bottomAnchor, constant: 30).isActive = true
        qLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        qLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        qLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        qTextField.topAnchor.constraint(equalTo: qLabel.topAnchor).isActive = true
        qTextField.leadingAnchor.constraint(equalTo: n1Label.trailingAnchor, constant: 10).isActive = true
        qTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        qTextField.heightAnchor.constraint(equalTo: eLabel.heightAnchor).isActive = true
        
        segmentControll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        segmentControll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        segmentControll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        segmentControll.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        purposeLabel.bottomAnchor.constraint(equalTo: segmentControll.topAnchor, constant: -20).isActive = true
        purposeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        purposeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        purposeLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        cipherOfBeltSegmentController.bottomAnchor.constraint(equalTo: purposeLabel.topAnchor, constant: -20).isActive = true
        cipherOfBeltSegmentController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        cipherOfBeltSegmentController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cipherOfBeltSegmentController.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        typeOfTransmissionSegmentControll.bottomAnchor.constraint(equalTo: cipherOfBeltSegmentController.topAnchor, constant: -20).isActive = true
        typeOfTransmissionSegmentControll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        typeOfTransmissionSegmentControll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        typeOfTransmissionSegmentControll.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        d1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        d1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        d1Label.heightAnchor.constraint(equalToConstant: 70).isActive = true
        d1Label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        aFinalLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        aFinalLabel.trailingAnchor.constraint(equalTo: d1Label.leadingAnchor, constant: -20).isActive = true
        aFinalLabel.leadingAnchor.constraint(equalTo: n1TextField.trailingAnchor, constant: 20).isActive = true
        aFinalLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        vLabel.topAnchor.constraint(equalTo: aFinalLabel.bottomAnchor, constant: 10).isActive = true
        vLabel.trailingAnchor.constraint(equalTo: d1Label.leadingAnchor, constant: -20).isActive = true
        vLabel.leadingAnchor.constraint(equalTo: n1TextField.trailingAnchor, constant: 20).isActive = true
        vLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        pLabel.topAnchor.constraint(equalTo: vLabel.bottomAnchor, constant: 10).isActive = true
        pLabel.trailingAnchor.constraint(equalTo: d1Label.leadingAnchor, constant: -20).isActive = true
        pLabel.leadingAnchor.constraint(equalTo: n1TextField.trailingAnchor, constant: 20).isActive = true
        pLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        d2Label.topAnchor.constraint(equalTo: d1Label.bottomAnchor, constant: 20).isActive = true
        d2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        d2Label.heightAnchor.constraint(equalToConstant: 70).isActive = true
        d2Label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        aResLabel.topAnchor.constraint(equalTo: d2Label.bottomAnchor, constant: 20).isActive = true
        aResLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        aResLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        aResLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        roundedDP1Label.topAnchor.constraint(equalTo: aResLabel.bottomAnchor, constant: 20).isActive = true
        roundedDP1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        roundedDP1Label.heightAnchor.constraint(equalToConstant: 70).isActive = true
        roundedDP1Label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        roundedDP2Label.topAnchor.constraint(equalTo: roundedDP1Label.bottomAnchor, constant: 20).isActive = true
        roundedDP2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        roundedDP2Label.heightAnchor.constraint(equalToConstant: 70).isActive = true
        roundedDP2Label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        remLengthLabel.topAnchor.constraint(equalTo: roundedDP2Label.bottomAnchor, constant: 20).isActive = true
        remLengthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        remLengthLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        remLengthLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        remRoundLengthLabel.topAnchor.constraint(equalTo: remLengthLabel.bottomAnchor, constant: 20).isActive = true
        remRoundLengthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        remRoundLengthLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        remRoundLengthLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        
    }
    
    @objc func didEndInputETextField(){
        guard let txt = eTextField.text else{
            return
        }
        if txt.count > 0{
            if  Float(txt)! >= 0.02 || Float(txt)! <= 0.01{
                let alertController = UIAlertController(title: "Ошибка", message: "Возможные значения в промежутке от 0.01 до 0.02", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Сейчас исправлю", style: .default) { (_) in
                    self.eTextField.text = String(0.0)
                }
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }else{
                print("Allgood")
            }
        }
    }
    
    @objc func qTextDieldDidEndEditing(){
        guard let txt = qTextField.text, txt != "" else{
            return
        }
        
        if Float(txt)! <= 110.0 || Float(txt)! >= 130{
            let alertController = UIAlertController(title: "Ошибка", message: "Возможные значения в промежутке от 110 до 130", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Сейчас исправлю", style: .default) { (_) in
                self.qTextField.text = ""
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func NormalisedTableTapped(){
        let navController = UINavigationController(rootViewController: ShowNormalizeTableViewController())
        present(navController, animated: true, completion: nil)
    }
    
    @objc func segmentValueDidChange(){
        switch segmentControll.selectedSegmentIndex {
        case 0:
            guard let tb = tTextField.text, tb != "" else{
                tTextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            
            dp1Res = formuls.getMinDiametrWithTorque(tb: Float(tb)!)
            model.tb = Double(tb)!
            model.DP1 = Double(dp1Res!)
            d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
        
        case 1:
             
            n1TextField.layer.borderColor = UIColor.systemBlue.cgColor
            guard let n1 = n1TextField.text, n1 != "" else{
                n1TextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            model.n1 = Double(n1)!
            
            if cipherOfBeltSegmentController.selectedSegmentIndex == -1{
                let alertController = UIAlertController(title: "Внимание", message: "Вы не выбрали шифр профиля ремня", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Сейчас выберу", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }else{
                switch cipherOfBeltSegmentController.selectedSegmentIndex {
                case 0:
                    let v = constants.tableValueO["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V:  v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "O"
                case 1:
                    let v = constants.tableValueA["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V:  v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "A"
                case 2:
                    let v = constants.tableValueB["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V:  v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "B"
                case 3:
                    let v = constants.tableValueV["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V: v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "V"
                case 4:
                    let v = constants.tableValueYO["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V:  v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "YO"
                case 5:
                    let v = constants.tableValueYA["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V:  v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "YA"
                case 6:
                    let v = constants.tableValueYB["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V:  v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "YB"
                case 7:
                    let v = constants.tableValueYV["V"]!
                    model.v = v as! Double
                    dp1Res = formuls.getMinDeametrForKPD(V:  v as! Double, n1: Float(n1)!)
                    model.DP1 = Double(dp1Res!)
                    d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                    getRoundedDP1()
                    model.D1 = Double(dp1Res!)
                    model.cipher = "YV"
                default:
                    let alertController = UIAlertController(title: "Внимание", message: "Произошла неизвестная ошибка", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Попробую позже", style: .cancel, handler: nil)
                    alertController.addAction(alertAction)
                    present(alertController, animated: true, completion: nil)
                }
            }
            
        case 2:
            
            guard let a = aTextField.text, a != "" else{
                aTextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            
            guard let n1 = n1TextField.text, n1 != "" else{
                n1TextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            
            guard let n2 = n2TextField.text, n2 != "" else{
                n2TextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            
            guard let e = eTextField.text, e != "" else{
                n2TextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            dp1Res = formuls.getMinDeamWithU(a: Float(a)!, n1: Float(n1)!, n2: Float(n2)!, E: Float(e)!)
            d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            model.DP1 = Double(dp1Res!)
            let dp1 = dp1Res
            getRoundedDP1()
            let d1 = dp1Res
            if dp1 == d1{
                roundedDP1Label.text = "Округленное значение DP1, D1 = \(dp1Res!)"
            }
            model.D1 = Double(dp1Res!)
        case 3:
            switch cipherOfBeltSegmentController.selectedSegmentIndex {
            case 0:
                dp1Res = (constants.tableValueO["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            case 1:
                dp1Res = (constants.tableValueA["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            case 2:
                dp1Res = (constants.tableValueB["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            case 3:
                dp1Res = (constants.tableValueV["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            case 4:
                dp1Res = (constants.tableValueYO["Dp1"] as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            case 5:
                dp1Res = (constants.tableValueYA["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            case 6:
                dp1Res = (constants.tableValueYB["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            case 7:
                dp1Res = (constants.tableValueYV["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
            default:
                let alertController = UIAlertController(title: "Внимание", message: "Произошла неизвестная ошибка", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Попробую позже", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
        default:
            let alertController = UIAlertController(title: "Внимание", message: "Произошла неизвестная ошибка", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Попробую позже", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    func getRoundedDP1(){
        let cons = constants.keyForRound
        var index = 0
        while dp1Res! > Float(cons[index]) && index < 14 {
            index += 1
        }

        if index > 0 {
            if abs(dp1Res! - Float(cons[index-1])) < abs(dp1Res! - Float(cons[index])){
                index = index - 1
            }
        }else{
            let delta = abs(dp1Res! - Float(cons[index]))
            print(delta)
            let delta2 = Float(constants.roundedDP1[cons[index]]!)
            print(delta2)
            if delta <= delta2{
                if Double(delta) > constants.roundedDP1[cons[index]]!{
                    roundedDP1Label.text = "Округленное значение DP1, D1 = \(dp1Res!)"
                }else{
                    roundedDP1Label.text = "Округленное значение DP1, D1 = \(cons[index])"
                    dp1Res = Float(cons[index])
                }
                
            }else{
                let alertController = UIAlertController(title: "Внимание", message: "Произошла ошибка в округлении DP1", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Проверить данные", style: .cancel){ (_) in
                    self.roundedDP1Label.text = "Округленное значение D1 = \(self.dp1Res!)"
                }
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        
        let delta = abs(dp1Res! - Float(cons[index]))
        print(delta)
        let delta2 = Float(constants.roundedDP1[cons[index]]!)
        print(delta2)
        if delta <= delta2{
            if Double(delta) > constants.roundedDP1[cons[index]]!{
                roundedDP1Label.text = "Округленное значение D1 = \(dp1Res!)"
            }else{
                roundedDP1Label.text = "Округленное значение D1 = \(cons[index])"
                dp1Res = Float(cons[index])
            }
        }else{
            let alertController = UIAlertController(title: "Внимание", message: "Произошла ошибка в округлении DP1", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Проверить данные", style: .cancel){(_) in
                self.roundedDP1Label.text = "Округленное значение D1 = \(self.dp1Res!)"
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func getRoundedDP2(){
        let cons = constants.keyForRound
        var index = 0
        while d2Res! > Float(cons[index]) {
            if index == 14{
                break
            }else{
                index += 1
            }
        }

        if index > 0 {
            if abs(d2Res! - Float(cons[index-1])) < abs(d2Res! - Float(cons[index])){
                index = index - 1
            }
        }else{
            let delta = abs(d2Res! - Float(cons[index]))
            print(delta)
            let delta2 = Float(constants.roundedDP1[cons[index]]!)
            print(delta2)
            if delta <= delta2{
                if Double(delta) > constants.roundedDP1[cons[index]]!{
                    roundedDP2Label.text = "Округленное значение D2 = \(d2Res!)"
                }else{
                    roundedDP2Label.text = "Округленное значение D2 = \(cons[index])"
                    d2Res = Float(cons[index])
                }
            }else{
                let alertController = UIAlertController(title: "Внимание", message: "Произошла ошибка в округлении DP2", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Проверить данные", style: .cancel){ (_) in
                    self.roundedDP2Label.text = "Округленное значение D2 = \(self.d2Res!)"
                }
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        
        let delta = abs(d2Res! - Float(cons[index]))
        print(delta)
        let delta2 = Float(constants.roundedDP1[cons[index]]!)
        print(delta2)
        if delta <= delta2{
            if Double(delta) > constants.roundedDP1[cons[index]]!{
                roundedDP2Label.text = "Округленное значение D2 = \(d2Res!)"
            }else{
                roundedDP2Label.text = "Округленное значение D2 = \(cons[index])"
                d2Res = Float(cons[index])
            }
//            roundedDP2Label.text = "Округленное значение D2 = \(cons[index])"
            d2Res = Float(cons[index])
            //MARK: - set here d2Res = cons[index]
        }else{
            let alertController = UIAlertController(title: "Внимание", message: "Произошла ошибка в округлении DP2", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Проверить данные", style: .cancel){ (_) in
                self.roundedDP2Label.text = "Округленное значение D2 = \(self.d2Res!)"
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func getRoundedLength(){
        let cons = constants.keyForLenght
        var index = 0
        while remLength! > Float(cons[index]) {
            if index == cons.count - 1{
                break
            }else{
                index += 1
            }
        }

        if index > 0 {
            if abs(remLength! - Float(cons[index-1])) < abs(remLength! - Float(cons[index])){
                index = index - 1
                remRoundLengthLabel.text = "Округленное значение L = \(cons[index])"
                remLength = Float(cons[index])
                model.L0 = Double(remLength!)
            }else{
                remRoundLengthLabel.text = "Округленное значение L = \(cons[index])"
                remLength = Float(cons[index])
                model.L0 = Double(remLength!)
            }
        }else{
            remRoundLengthLabel.text = "Округленное значение L = \(cons[index])"
            remLength = Float(cons[index])
            model.L0 = Double(remLength!)
        }
        
    }
    
    @objc func typeOfBeltSegmentControllerValueDidChange(){
        if segmentControll.selectedSegmentIndex != 1{
            
            switch cipherOfBeltSegmentController.selectedSegmentIndex {
            case 0:
                dp1Res = (constants.tableValueO["Dp1"]! as! Float)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                model.b0 = constants.tableValueO["b0"] as! Double
                model.bp = constants.tableValueO["bp"] as! Double
                model.hc = constants.tableValueO["hc"] as! Double
                model.vTab = constants.tableValueO["V"] as! Double
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "О"
            case 1:
                dp1Res = (constants.tableValueA["Dp1"]! as! Float)
                model.b0 = constants.tableValueA["b0"] as! Double
                model.bp = constants.tableValueA["bp"] as! Double
                model.hc = constants.tableValueA["hc"] as! Double
                model.vTab = constants.tableValueA["V"] as! Double
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "А"
            case 2:
                dp1Res = (constants.tableValueB["Dp1"]! as! Float)
                model.b0 = constants.tableValueB["b0"] as! Double
                model.bp = constants.tableValueB["bp"] as! Double
                model.hc = constants.tableValueB["hc"] as! Double
                model.vTab = constants.tableValueB["V"] as! Double
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "Б"
            case 3:
                dp1Res = (constants.tableValueV["Dp1"]! as! Float)
                model.b0 = constants.tableValueV["b0"] as! Double
                model.bp = constants.tableValueV["bp"] as! Double
                model.hc = constants.tableValueV["hc"] as! Double
                model.vTab = constants.tableValueV["V"] as! Double
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "В"
            case 4:
                dp1Res = (constants.tableValueYO["Dp1"] as! Float)
                model.b0 = constants.tableValueYO["b0"] as! Double
                model.bp = constants.tableValueYO["bp"] as! Double
                model.vTab = constants.tableValueYO["V"] as! Double
                model.hc = constants.tableValueYO["hc"] as! Double
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УО"
            case 5:
                dp1Res = (constants.tableValueYA["Dp1"]! as! Float)
                model.b0 = constants.tableValueYA["b0"] as! Double
                model.bp = constants.tableValueYA["bp"] as! Double
                model.vTab = constants.tableValueYA["V"] as! Double
                model.hc = constants.tableValueYA["hc"] as! Double
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УА"
            case 6:
                dp1Res = (constants.tableValueYB["Dp1"]! as! Float)
                model.b0 = constants.tableValueYB["b0"] as! Double
                model.bp = constants.tableValueYB["bp"] as! Double
                model.vTab = constants.tableValueYB["V"] as! Double
                model.hc = constants.tableValueYB["hc"] as! Double
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УБ"
            case 7:
                dp1Res = (constants.tableValueYV["Dp1"]! as! Float)
                model.b0 = constants.tableValueYV["b0"] as! Double
                model.bp = constants.tableValueYV["bp"] as! Double
                model.vTab = constants.tableValueYV["V"] as! Double
                model.hc = constants.tableValueYV["hc"] as! Double
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УВ"
            default:
                let alertController = UIAlertController(title: "Внимание", message: "Произошла неизвестная ошибка", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Попробую позже", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
        }else{
            guard let n1 = n1TextField.text, n1 != "" else{
                n1TextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            model.n1 = Double(n1)!
            
            switch cipherOfBeltSegmentController.selectedSegmentIndex {
            case 0:
                let vTab = constants.tableValueO["V"]!
                model.vTab = vTab as! Double
                model.b0 = constants.tableValueO["b0"] as! Double
                model.bp = constants.tableValueO["bp"] as! Double
                model.hc = constants.tableValueO["hc"] as! Double
                dp1Res = formuls.getMinDeametrForKPD(V:  vTab as! Double, n1: Float(n1)!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                model.DP1 = Double(dp1Res!)
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "О"
                
            case 1:
                let vTab = constants.tableValueA["V"]!
                model.b0 = constants.tableValueA["b0"] as! Double
                model.bp = constants.tableValueA["bp"] as! Double
                model.hc = constants.tableValueA["hc"] as! Double
                model.vTab = vTab as! Double
                dp1Res = formuls.getMinDeametrForKPD(V:  vTab as! Double, n1: Float(n1)!)
                model.DP1 = Double(dp1Res!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "А"
            case 2:
                let vTab = constants.tableValueB["V"]!
                model.b0 = constants.tableValueB["b0"] as! Double
                model.bp = constants.tableValueB["bp"] as! Double
                model.hc = constants.tableValueB["hc"] as! Double
                model.vTab = vTab as! Double
                dp1Res = formuls.getMinDeametrForKPD(V:  vTab as! Double, n1: Float(n1)!)
                model.DP1 = Double(dp1Res!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "Б"
            case 3:
                let vTab = constants.tableValueV["V"]!
                model.b0 = constants.tableValueV["b0"] as! Double
                model.bp = constants.tableValueV["bp"] as! Double
                model.hc = constants.tableValueV["hc"] as! Double
                model.vTab = vTab as! Double
                dp1Res = formuls.getMinDeametrForKPD(V: vTab as! Double, n1: Float(n1)!)
                model.DP1 = Double(dp1Res!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "В"
            case 4:
                let vTab = constants.tableValueYO["V"]!
                model.b0 = constants.tableValueYO["b0"] as! Double
                model.bp = constants.tableValueYO["bp"] as! Double
                model.hc = constants.tableValueYO["hc"] as! Double
                model.vTab = vTab as! Double
                dp1Res = formuls.getMinDeametrForKPD(V: vTab as! Double, n1: Float(n1)!)
                model.DP1 = Double(dp1Res!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УО"
            case 5:
                let vTab = constants.tableValueYA["V"]!
                model.b0 = constants.tableValueYA["b0"] as! Double
                model.bp = constants.tableValueYA["bp"] as! Double
                model.hc = constants.tableValueYA["hc"] as! Double
                model.vTab = vTab as! Double
                dp1Res = formuls.getMinDeametrForKPD(V:  vTab as! Double, n1: Float(n1)!)
                model.DP1 = Double(dp1Res!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УА"
            case 6:
                let vTab = constants.tableValueYB["V"]!
                model.b0 = constants.tableValueYB["b0"] as! Double
                model.bp = constants.tableValueYB["bp"] as! Double
                model.hc = constants.tableValueYB["hc"] as! Double
                model.vTab = vTab as! Double
                dp1Res = formuls.getMinDeametrForKPD(V:  vTab as! Double, n1: Float(n1)!)
                model.DP1 = Double(dp1Res!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УБ"
            case 7:
                let vTab = constants.tableValueYV["V"]!
                model.b0 = constants.tableValueYV["b0"] as! Double
                model.bp = constants.tableValueYV["bp"] as! Double
                model.hc = constants.tableValueYV["hc"] as! Double
                model.vTab = vTab as! Double
                dp1Res = formuls.getMinDeametrForKPD(V:  vTab as! Double, n1: Float(n1)!)
                model.DP1 = Double(dp1Res!)
                d1Label.text = "Минимальный диаметр, DP1 = \(dp1Res!)"
                getRoundedDP1()
                model.D1 = Double(dp1Res!)
                model.cipher = "УБ"
            default:
                let alertController = UIAlertController(title: "Внимание", message: "Произошла неизвестная ошибка", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Попробую позже", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @objc func typeOfTransmissionSegmentControllValueDidChange(){
        
        guard let n = nTextField.text, n != "" else {
            nTextField.layer.borderColor = UIColor.systemRed.cgColor
            return
        }
        model.n = Double(n)!
        
        guard let n1 = n1TextField.text, n1 != "" else {
            n1TextField.layer.borderColor = UIColor.systemRed.cgColor
            return
        }
        model.n1 = Double(n1)!

        
        guard let n2 = n2TextField.text, n2 != "" else {
            n2TextField.layer.borderColor = UIColor.systemRed.cgColor
            return
        }
        model.n2 = Double(n2)!
        
        guard let e = eTextField.text, e != "" else {
            eTextField.layer.borderColor = UIColor.systemRed.cgColor
            return
        }
        model.e = Double(e)!
        
        guard let q = qTextField.text, q != "" else {
            qTextField.layer.borderColor = UIColor.systemRed.cgColor
            return
        }
        model.q = Double(q)!
        
        guard let a = aTextField.text, a != "" else {
            aTextField.layer.borderColor = UIColor.systemRed.cgColor
            return
        }
        
        switch typeOfTransmissionSegmentControll.selectedSegmentIndex {
        case 0:
            guard let dp1 = dp1Res else{
                let alertController = UIAlertController(title: "Ошибка", message: "Выберите шифр ремня", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Сейчас исправлю", style: .default) { (_) in
                    self.cipherOfBeltSegmentController.selectedSegmentIndex = -1
                }
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
                return
            }
            d2Res = formuls.getDiamBolShkivaForLow(N: Float(n)!, n1: Float(n1)!, n2: Float(n2)!, E: Float(e)!, Q: Float(q)!)
            model.DP2 = Double(d2Res!)
            d2Label.text = "Диаметр большего шкифа, DP2 = \(d2Res!)"
            guard let h = hTextField.text, h != "" else {
                hTextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            getRoundedDP2()
            model.D2 = Double(d2Res!)
            let aSel = formuls.getMinAndMaxAReturnA_Sel(Dp1: dp1, Dp2: d2Res!, h: Float(h)!)
            model.aMin = Double(aSel.0)
            model.aMax = Double(aSel.1)
            model.aSel = Double(aSel.2)
            aResLabel.text = "Межосевое расстояние, а = \(aSel.2)"
            
            remLength = formuls.getLenghtRem(D1: dp1Res!, D2: d2Res!, aSel: aSel.0)
            model.L = Double(remLength!)
            remLengthLabel.text = "Длинна ремня, L = \(remLength!)"
            getRoundedLength()
            let Dcp = formuls.getDcp(D1: dp1Res!, D2: d2Res!)
            model.Dcp = Double(Dcp)
            let delta = formuls.getDelta(D1: dp1Res!, D2: d2Res!)
            model.delta = Double(delta)
            let lambda = formuls.getLambda(LO: remLength!, Dcp: Dcp)
            model.lambda = Double(lambda)
            let aFin = formuls.getAFin(delta: delta, lambda: lambda)
            model.aFin = Double(aFin)
            aFinalLabel.text = "Финальное значение, a_fin = \(aFin)"
            
            let v = formuls.getV(Dp1: dp1Res!, n1: Float(n1)!)
            model.vRes = Double(v)
            vLabel.text = "Скорость, v = \(v)"
            
            let p = formuls.getP(Dp1: dp1Res!, Dp2: d2Res!, aFin: aFin)
            pLabel.text = "Угол обхвата, p \(p)"
            model.P = Double(p)
            model.D2 = Double(d2Res!)
            
            model.typeOfTransmission = "Пониженная"
        case 1:
            d2Res = formuls.getDiamBolShkivaForRaise(N: Float(n)!, n1: Float(n1)!, n2: Float(n2)!, E: Float(e)!, Q: Float(q)!)
            model.DP2 = Double(d2Res!)
            d2Label.text = "Диаметр большего шкифа, DP2 = \(d2Res!)"
            getRoundedDP2()
            model.D2 = Double(d2Res!)
            guard let h = hTextField.text, h != "" else {
                hTextField.layer.borderColor = UIColor.systemRed.cgColor
                return
            }
            let aSel = formuls.getMinAndMaxAReturnA_Sel(Dp1: dp1Res!, Dp2: d2Res!, h: Float(h)!)
            aResLabel.text = "Межосевое расстояние, а = \(aSel.2)"
            model.aMin = Double(aSel.0)
            model.aMax = Double(aSel.1)
            model.aSel = Double(aSel.2)
            remLength = formuls.getLenghtRem(D1: dp1Res!, D2: d2Res!, aSel: aSel.0)
            model.L = Double(remLength!)
            remLengthLabel.text = "Длинна ремня, L = \(remLength!)"
            getRoundedLength()
            let Dcp = formuls.getDcp(D1: dp1Res!, D2: d2Res!)
            model.Dcp = Double(Dcp)
            let delta = formuls.getDelta(D1: dp1Res!, D2: d2Res!)
            model.delta = Double(delta)
            let lambda = formuls.getLambda(LO: remLength!, Dcp: Dcp)
            model.lambda = Double(lambda)
            let aFin = formuls.getAFin(delta: delta, lambda: lambda)
            model.aFin = Double(aFin)
            aFinalLabel.text = "Финальное значение, a_fin = \(aFin)"
            
            let v = formuls.getV(Dp1: dp1Res!, n1: Float(n1)!)
            vLabel.text = "Скорость, v \(v)"
            model.vRes = Double(v)
            let p = formuls.getP(Dp1: dp1Res!, Dp2: d2Res!, aFin: aFin)
            model.P = Double(p)
            pLabel.text = "Угол обхвата, p \(p)"
            model.typeOfTransmission = "Повышенная"
        default:
            let alertController = UIAlertController(title: "Внимание", message: "Произошла неизвестная ошибка", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Попробую позже", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func saveItemTapped(){
        
        if let n1 = n1TextField.text{
            if n1 != ""{
                model.n1 = Double(n1)!
            }
        }
        
        if let n2 = n2TextField.text{
            if n2 != ""{
                model.n2 = Double(n2)!
            }
        }
        
        if let a = aTextField.text{
            if a != ""{
                model.a = Double(a)!
            }
        }
        
        if let e = eTextField.text{
            if e != "" {
                model.e = Double(e)!
            }
        }
        
        if let n = nTextField.text{
            if n != "" {
                model.n = Double(n)!
            }
        }
        
        if let h = hTextField.text{
            if h != "" {
                model.h = Double(h)!
            }
        }
        
        if let tb = tTextField.text{
            if tb != "" {
                model.tb = Double(tb)!
            }
        }
        
        if let q = qTextField.text{
            if q != "" {
                model.q = Double(q)!
            }
        }
        
        print(model)
        saveData.saveData(item: model)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
