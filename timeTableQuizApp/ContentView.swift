import SwiftUI

struct ContentView: View {
    let numbers = Array(1...10) // Numbers 1 to 10
    @State private var selectedNumber = 2
    @State private var question = ""
    @State private var correctAnswer = 0
    @State private var userAnswer = ""
    @State private var feedback = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("🧠 Times Table Quiz")
                .font(.largeTitle)
                .bold()

            Picker("Choose number", selection: $selectedNumber) {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .pickerStyle(.segmented)

            Button("New Question") {
                askQuestion()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            if !question.isEmpty {
                Text(question)
                    .font(.title2)

                TextField("Your answer", text: $userAnswer)
                    .keyboardType(.numberPad)
                    .padding()
                    .border(Color.gray)

                Button("Check Answer") {
                    checkAnswer()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)

                Text(feedback)
                    .font(.headline)
                    .foregroundColor(feedback.contains("Correct") ? .green : .red)
            }
        }
        .padding()
    }

    func askQuestion() {
        let random = Int.random(in: 1...10)
        correctAnswer = selectedNumber * random
        question = "What is \(selectedNumber) × \(random)?"
        userAnswer = ""
        feedback = ""
    }

    func checkAnswer() {
        if Int(userAnswer) == correctAnswer {
            feedback = "✅ Correct!"
        } else {
            feedback = "❌ Oops! The answer was \(correctAnswer)."
        }
    }
}

#Preview {
    ContentView()
}

