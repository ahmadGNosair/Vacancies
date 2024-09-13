//
//  ViewController.swift
//  Vacancies
//
//  Created by Ahmad Nosair on 13/09/2024.
//

import UIKit

class ViewController: UIViewController {

    var vacancies = [Vacancy]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove the separator line between cells
        tableview.separatorStyle = .none
        tableview.separatorInset = UIEdgeInsets.zero
        
        getFonts()
        tableview.delegate = self
        
        fetchVacancies(URL: "https://www.unhcrjo.org/jobs/api") { result in
            self.vacancies = result
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
           print(result)
           
       }
    }
    
      
    
    func getFonts(){
        for family in UIFont.familyNames {
            print("Font family: \(family)")
            for font in UIFont.fontNames(forFamilyName: family) {
                print("----Font: \(font)")
            }
        }
    }
    
    
    func fetchVacancies(URL url: String, completion: @escaping ([Vacancy]) -> Void) {
        
        let url  = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do{
                    let parsingData = try JSONDecoder().decode([Vacancy].self, from: data!)
                    completion(parsingData)
                }catch{
                    print("Error Parsing Data: \(error)")
                }
            }
            
        }
        dataTask.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacancies.count
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "Vacancy_Cell", for: indexPath) as! VacanciesViewCell?
        
        cell!.fillCell(JobImage: vacancies[indexPath.row].image_url,
                      Title: vacancies[indexPath.row].title,
                      Company: vacancies[indexPath.row].company,
                      Date: vacancies[indexPath.row].date_posted,
                      Description: vacancies[indexPath.row].description)
        cell!.layer.cornerRadius = 25
        cell!.layer.backgroundColor = colors().UNBlue.cgColor  //CGColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DeatilsViewController{
            self.navigationController?.pushViewController(vc, animated: true)
            vc.viewDidLoad()
            
            let url = URL(string: vacancies[indexPath.row].image_url)
            URLSession.shared.dataTask(with: url!) { data, response, error in
                // Handle error or empty data case
                if let error = error {
                    print("Error loading image: \(error)")
                    return
                }
                
                // Check if data exists and is valid
                guard let data = data, let image = UIImage(data: data) else {
                    print("Invalid image data")
                    return
                }
                
                // Update the image on the main thread
                DispatchQueue.main.async {
                    vc.jobImage?.image =  image
                }
            }.resume()
            
            
            vc.vac = vacancies[indexPath.row]

        }
    }
}


