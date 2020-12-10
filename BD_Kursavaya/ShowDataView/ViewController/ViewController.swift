//
//  ViewController.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 02.12.2020.
//

import UIKit
import SwiftDataTables

class ViewController: UIViewController {
    
//    var saveData = SaveData()
//    lazy var dataTable = makeDataTable()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let button =  UIButton(type: .custom)
//        button.setImage(UIImage(systemName: "plus"), for:.normal)
//        button.addTarget(self, action: #selector(addItemTapped), for: .touchUpInside)
//        button.frame = CGRect(x:0, y:0, width:32, height:32)
//        let barButton = UIBarButtonItem(customView: button)
//        self.navigationItem.rightBarButtonItem = barButton
//
//
//        view.backgroundColor = .white
//        [dataTable].forEach{view.addSubview($0)}
//        dataTable.reloadRowsOnly()
//        dataTable.reloadEverything()
//        setConstraints()
//
//    }
//
//    @objc func addItemTapped(){
//        self.navigationController?.pushViewController(InputDataViewController(), animated: true)
//    }
//
//    func setConstraints(){
//        NSLayoutConstraint.activate([
//            dataTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//            dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            dataTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
//            dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
//    }
//}
//
//extension ViewController {
//    private func makeDataTable() -> SwiftDataTable {
//        let dataTable = SwiftDataTable(dataSource: self)
//        dataTable.translatesAutoresizingMaskIntoConstraints = false
//        dataTable.delegate = self
//        dataTable.dataSource = self
//        return dataTable
//    }
//}
//extension ViewController: SwiftDataTableDataSource {
//    public func dataTable(_ dataTable: SwiftDataTable, headerTitleForColumnAt columnIndex: NSInteger) -> String {
//        return self.columnHeaders()[columnIndex]
//    }
//
//    public func numberOfColumns(in: SwiftDataTable) -> Int {
//        return data().count
//    }
//
//    func numberOfRows(in: SwiftDataTable) -> Int {
//        return self.data().count
//    }
//
//    public func dataTable(_ dataTable: SwiftDataTable, dataForRowAt index: NSInteger) -> [DataTableValueType] {
//        return self.data()[index]
//    }
//}
//
//extension ViewController: SwiftDataTableDelegate{
//
//    func didSelectItem(_ dataTable: SwiftDataTable, indexPath: IndexPath) {
//        print(indexPath.index)
//        let index = Int (dataTable.data(for: indexPath).stringRepresentation)!
//        saveData.removeData(item: index)
//        dataTable.reload()
//    }
//    func fixedColumns(for dataTable: SwiftDataTable) -> DataTableFixedColumnType {
//        return .init(leftColumns: 1)
//    }
//}
//
//extension ViewController {
//    func columnHeaders() -> [String] {
//        return [
//            "Номер передачи",
//            "n1",
//            "n2",
//            "a",
//            "e",
//            "n",
//            "h",
//            "tb",
//            "q",
//            "v",
//            "Шифр",
//            "Передача",
//            "DP1",
//            "DP2",
//            "aSel",
//            "aMin",
//            "b0",
//            "bp",
//            "hc",
//            "aMax",
//            "D1",
//            "D2",
//            "Dcp",
//            "L",
//            "L0",
//            "delta",
//            "lambda",
//            "aFin",
//            "vTab",
//            "vRes",
//            "P"
//        ]
//    }
//
//    func data() -> [[DataTableValueType]]{
//        //This would be your json object
//        //        var dataSet: [[Any]] = exampleDataSet()
//        var dataSet: [[Any]] = getCounteData()
//        for _ in 0..<0 {
//            dataSet += getCounteData()
//        }
//
//        return dataSet.map {
//            $0.compactMap (DataTableValueType.init)
//        }
//    }
//}

//    //
    lazy var dataTable = makeDataTable()
    let saveData = SaveData()
    var dataSource: DataTableContent = []
    let headerTitles = [
        "Номер передачи", "n1", "n2", "a", "e", "n", "h", "tb", "q", "v", "Шифр", "Передача", "DP1", "DP2", "aSel", "aMin", "b0", "bp", "hc", "aMax", "D1", "D2", "Dcp", "L", "L0", "delta", "lambda", "aFin", "vTab", "vRes", "P"
    ]

    init() {
        super.init(nibName: nil, bundle: nil)
        addDataSourceAfter()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addDataSourceAfter()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button =  UIButton(type: .custom)
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "plus"), for:.normal)
        } else {
            button.setImage(UIImage(named: "plus"), for: .normal)
        }
        button.addTarget(self, action: #selector(addItemTapped), for: .touchUpInside)
        button.frame = CGRect(x:0, y:0, width:32, height:32)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
//        addDataSourceAfter()
        setupViews()
        setupConstraints()
    }
    func setupViews() {
//        if #available(iOS 11.0, *) {
//            scrollview.contentInsetAdjustmentBehavior = .never
//        } else {
            automaticallyAdjustsScrollViewInsets = true
//        }
        navigationController?.navigationBar.isTranslucent = false
        title = "Данные"
        view.backgroundColor = UIColor.white
        view.addSubview(dataTable)
        dataTable.reload()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            dataTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    @objc func addItemTapped(){
        self.navigationController?.pushViewController(InputDataViewController(), animated: true)
    }

    public func addDataSourceAfter(){
        self.dataSource = data()
        dataTable.reload()
    }

    func data() -> [[DataTableValueType]]{
        var dataSet: [[Any]] = getCounteData()
        for _ in 0..<0 {
            dataSet += getCounteData()
        }

        return dataSet.map {
            $0.compactMap (DataTableValueType.init)
        }
    }
}

extension ViewController {
    private func makeDataTable() -> SwiftDataTable {
        let dataTable = SwiftDataTable(dataSource: self, options: makeOptions())
        dataTable.translatesAutoresizingMaskIntoConstraints = false
        dataTable.delegate = self
        return dataTable
    }
    func makeOptions() -> DataTableConfiguration {
        var options = DataTableConfiguration()
        options.shouldContentWidthScaleToFillFrame = true
        options.defaultOrdering = DataTableColumnOrder(index: 0, order: .ascending)
        
        return options
    }
}
extension ViewController: SwiftDataTableDataSource {
    public func dataTable(_ dataTable: SwiftDataTable, headerTitleForColumnAt columnIndex: NSInteger) -> String {
        return self.headerTitles[columnIndex]
    }
    
    public func numberOfColumns(in: SwiftDataTable) -> Int {
        return headerTitles.count
    }
    
    func numberOfRows(in: SwiftDataTable) -> Int {
        return self.dataSource.count
    }
    
    public func dataTable(_ dataTable: SwiftDataTable, dataForRowAt index: NSInteger) -> [DataTableValueType] {
        return self.dataSource[index]
    }
}

extension ViewController: SwiftDataTableDelegate {
    func didSelectItem(_ dataTable: SwiftDataTable, indexPath: IndexPath) {
        print(indexPath.index)
        let index = Int (dataTable.data(for: indexPath).stringRepresentation)!
        saveData.removeData(item: index - 1)
        addDataSourceAfter()
    }
    func fixedColumns(for dataTable: SwiftDataTable) -> DataTableFixedColumnType {
        return .init(leftColumns: 1)
    }
}
