//
//  Table4ViewController.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 09.12.2020.
//

import UIKit
import SwiftDataTables

class Table4ViewController: UIViewController {

   
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

extension Table4ViewController {
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

extension Table4ViewController: SwiftDataTableDelegate {
    func didSelectItem(_ dataTable: SwiftDataTable, indexPath: IndexPath) {
        debugPrint("did select item at indexPath: \(indexPath) dataValue: \(dataTable.data(for: indexPath))")
    }
    func fixedColumns(for dataTable: SwiftDataTable) -> DataTableFixedColumnType {
        return .init(leftColumns: 1, rightColumns: 1)
    }
}
extension Table4ViewController {
    func columnHeaders() -> [String] {
        return [
            "Диаметр шкива D, мм",
            "Предельное отклонение, мм"
        ]
    }
    
    func data() -> [[DataTableValueType]]{
        //This would be your json object
//        var dataSet: [[Any]] = exampleDataSet()
        var dataSet: [[Any]] = normalizeTable4()
        for _ in 0..<0 {
            dataSet += normalizeTable4()
        }
        
        return dataSet.map {
            $0.compactMap (DataTableValueType.init)
        }
    }
}


