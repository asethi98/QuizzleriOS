import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // Option1, Option2, Option3
        
        if quizBrain.checkAnswer(userAnswer!) {
            sender.backgroundColor = #colorLiteral(red: 0.06734032381, green: 0.7468058467, blue: 0.5221046565, alpha: 1)
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.9393423315, green: 0.2905227352, blue: 0.1578783796, alpha: 1)
        }
        
        quizBrain.goToNextQuestion()
        
        // Update the UI after 0.2 seconds
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionTitle()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        optionButton1.setTitle(quizBrain.getAnswerChoice(answerChoice: 1), for: .normal)
        optionButton2.setTitle(quizBrain.getAnswerChoice(answerChoice: 2), for: .normal)
        optionButton3.setTitle(quizBrain.getAnswerChoice(answerChoice: 3), for: .normal)
        
        optionButton1.backgroundColor = UIColor.clear
        optionButton2.backgroundColor = UIColor.clear
        optionButton3.backgroundColor = UIColor.clear
    }
       
}
