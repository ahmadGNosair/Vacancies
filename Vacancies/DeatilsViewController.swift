//
//  DeatilsViewController.swift
//  Vacancies
//
//  Created by Ahmad Nosair on 13/09/2024.
//

import UIKit

class DeatilsViewController: UIViewController {
    
    
    var vac: Vacancy? = nil
    
    
    @IBOutlet weak var longDescription: UITextView!
    
    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var JobID: UILabel!
    @IBOutlet weak var jobImage: UIImageView!
    
   
    @IBOutlet weak var jobTitle: UILabel?
    
    @IBOutlet weak var Company: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    
    @IBOutlet weak var aboutJob: UILabel!
    
    @IBOutlet weak var roleDesc: UILabel!
    @IBOutlet weak var Salary: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        UISetup()
             
         }
         
         
    
    
    func UISetup(){
        //Image UI
        
        jobImage?.translatesAutoresizingMaskIntoConstraints = false
        jobImage?.clipsToBounds = true
        jobImage?.layer.cornerRadius = 30
        
        
        //Title UI
        jobTitle?.textColor = colors().UNBlue
        jobTitle?.font = UIFont(name: "ProximaNovaCond-Extrabld", size: 22)
        
        //about and description UI
        aboutJob?.textColor = colors().UNBlue
        aboutJob?.font = UIFont(name: "ProximaNovaCond-Extrabld", size: 18)
        roleDesc?.textColor = colors().UNBlue
        roleDesc?.font = UIFont(name: "ProximaNovaCond-Extrabld", size: 18)
        
        //Disable textview Editing
        Description?.isEditable = false
        Description?.isScrollEnabled = false
        longDescription?.isEditable  = false
        longDescription?.isScrollEnabled = false
        
        //change font style
        Company?.font = UIFont(name: "ProximaNova-Regular", size: 14)
        location?.font = UIFont(name: "ProximaNova-Regular", size: 14)
        Date?.font = UIFont(name: "ProximaNova-Regular", size: 14)
        Salary?.font = UIFont(name: "ProximaNova-Regular", size: 14)
        JobID?.font = UIFont(name: "ProximaNova-Regular", size: 14)

        
        
        
    }

func fillData(){
    
    if let vac = vac {
        self.jobTitle?.text = vac.title
        
        self.Company.text = vac.company
        self.location.text = vac.location
        self.Salary.numberOfLines = 0
        self.Salary.translatesAutoresizingMaskIntoConstraints = false
        self.Salary.text = "Salary: \(vac.salary)"
        self.Date.text = vac.date_posted
        self.JobID.text = "Job ID: \(vac.job_id)"
        self.Description.text = vac.description
        self.longDescription.text = vac.long_description

    }
}
}

    
    

