//
//  PersonsTableViewController.swift
//  Mr. Kenn
//
//  Created by student on 11/12/18.
//  Copyright © 2018 raj. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonFetcher.personFetcher.fetchPersons()
        NotificationCenter.default.addObserver(self, selector: #selector(personsFetched),                                                                                          name: .PersonsFetched, object:  nil)
    }
    @objc func personsFetched() {
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonFetcher.personFetcher.numPerson()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        cell.textLabel?.text = PersonFetcher.personFetcher[indexPath.row].name.last
        cell.detailTextLabel?.text = "\(PersonFetcher.personFetcher[indexPath.row].name.first) \(PersonFetcher.personFetcher[indexPath.row].age)"
        return cell
    }
}
