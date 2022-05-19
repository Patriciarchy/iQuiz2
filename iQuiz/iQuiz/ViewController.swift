//
//  ViewController.swift
//  iQuiz
//
//  Created by Patricia Ma on 5/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tappedSetting: UIBarButtonItem!
    
    let categories = ["Mathematics", "Marvel Super Heroes", "Science"]
    let descriptions = ["A quiz about mathematics!", "Do you like Marvel?", "Science quiz time!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func settings () {
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action in print("Settings tapped")}))
        present(alert, animated: true)
    }
    
    //Write math function
    func startMathQuiz() {
        let mathvc = storyboard?.instantiateViewController(withIdentifier:"MathViewController") as! MathViewController
        mathvc.modalPresentationStyle = .fullScreen
        present(mathvc, animated: true)
    }
    
   func startMarvelQuiz() {
       let marvelvc = storyboard?.instantiateViewController(withIdentifier:"MarvelViewController") as! MarvelViewController
       marvelvc.modalPresentationStyle = .fullScreen
       present(marvelvc, animated: true)
   }
    
    func startScienceQuiz() {
        let sciencevc = storyboard?.instantiateViewController(withIdentifier:"ScienceViewController") as! ScienceViewController
        sciencevc.modalPresentationStyle = .fullScreen
        present(sciencevc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = categories[indexPath.row]
        if (select == "Mathematics") {
            startMathQuiz()
        } else if (select == "Marvel Super Heroes") {
            startMarvelQuiz()
        } else {
            startScienceQuiz()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",
                                                 for: indexPath) as! CustomCell
        cell.TitleView.text = categories[indexPath.row]
        cell.DescriptionView.text = descriptions[indexPath.row]
        let category = categories[indexPath.row]
        cell.ImageView.image = UIImage(named: category)
        return cell
    }
}

class MathViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mathTableCell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    var game = [Question]()
    var currentQuestion: Question?
    

    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var mathTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI(question: game.first!)
    }
    
    private func configureUI(question: Question) {
        mathLabel.text = question.text
        currentQuestion = question
        mathTable.delegate = self
        mathTable.dataSource = self
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: {$0.text == answer.text}) && answer.correct
    }
    
    
    private func setupQuestions(){
        game.append(Question(text: "What is 2 + 2? ", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "16", correct: false),
            Answer(text: "4", correct: true),
            Answer(text: "5", correct: false),
        ]))
    }

}

class MarvelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

class ScienceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct : Bool
}

class Math2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
