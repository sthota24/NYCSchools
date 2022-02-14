//
//  ViewController.swift
//  20220213-SrikanthThota-NYCSchools
//
//  Created by Srikanth on 2/13/22.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    var SchoolsData: [schoolName]?
    var scoreInfo: satInfo?
    var networking = Network()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "NYC Schools"
        navigationController?.navigationBar.prefersLargeTitles = true
        getListOfHighSchools()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SchoolsData?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SchoolViewCell
        if let schoolDetails = self.SchoolsData {
            cell.setup(model: schoolDetails[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let selectedSchool = SchoolsData?[indexPath.row].dbn {
            getScoreDetails(queryString: selectedSchool) {
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let SchoolDetails = storyboard.instantiateViewController(withIdentifier: "SchoolDetails") as! SchoolDetailsViewController
                    guard let info = self.scoreInfo, let dbn = info.dbn, !dbn.isEmpty else {
                        self.showAlert(message: "Empty Data, Try again Later")
                        return
                    }
                    SchoolDetails.scoreInfo = info
                    self.navigationController?.pushViewController(SchoolDetails, animated: true)
                }
            }
        }
    }
}

extension ViewController {
    func getListOfHighSchools() {
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        networking.getData(urlString: urlString) {[weak self] (schoolList:Result<[schoolName], NetworkError>) in
            guard let self = self else {return}
            switch schoolList {
            case .success(let schoolList):
                self.SchoolsData = schoolList
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.showAlert(message: error.stringValue())
            }
        }
    }
    
    func getScoreDetails(queryString: String, completion: @escaping () -> ()) {
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=" + queryString
        networking.getData(urlString: urlString) {[weak self] (result:Result<[satInfo], NetworkError>) in
            guard let self = self else {return}
            switch result {
            case .success(let result):
                self.scoreInfo = result.first
                completion()
            case .failure(let error):
                self.showAlert(message: error.stringValue())
            }
        }
    }
}

extension UIViewController {
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

