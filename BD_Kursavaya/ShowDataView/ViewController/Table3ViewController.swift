//
//  table3ViewController.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 09.12.2020.
//

import UIKit
import SwiftDataTables

class Table3ViewController: UIViewController {

    lazy var dataTable = makeDataTable()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        [dataTable].forEach{view.addSubview($0)}
        setConstraints()
        
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            dataTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension Table3ViewController {
    func makeOptions() -> DataTableConfiguration {
        var options = DataTableConfiguration()
        options.shouldContentWidthScaleToFillFrame = true
        options.defaultOrdering = DataTableColumnOrder(index: 1, order: .ascending)
        return options
    }
    func makeDataTable() -> SwiftDataTable {
        let dataTable = SwiftDataTable(
            data: data(),
            headerTitles: columnHeaders(),
            options: makeOptions()
        )
        dataTable.translatesAutoresizingMaskIntoConstraints = false
        dataTable.backgroundColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        return dataTable
    }
}

extension Table3ViewController: SwiftDataTableDelegate {
    func didSelectItem(_ dataTable: SwiftDataTable, indexPath: IndexPath) {
        debugPrint("did select item at indexPath: \(indexPath) dataValue: \(dataTable.data(for: indexPath))")
    }
    func fixedColumns(for dataTable: SwiftDataTable) -> DataTableFixedColumnType {
        return .init(leftColumns: 1, rightColumns: 1)
    }
}
extension Table3ViewController {
    func columnHeaders() -> [String] {
        return [
            "Длина ремня расчетная, мм",
            "Наибольшая разносить между длинами комплектующих клиновых ремней, мм"
        ]
    }
    
    func data() -> [[DataTableValueType]]{
        //This would be your json object
//        var dataSet: [[Any]] = exampleDataSet()
        var dataSet: [[Any]] = normalizeTable3()
        for _ in 0..<0 {
            dataSet += normalizeTable3()
        }
        
        return dataSet.map {
            $0.compactMap (DataTableValueType.init)
        }
    }
}


