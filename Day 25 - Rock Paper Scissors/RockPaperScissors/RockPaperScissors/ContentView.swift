import SwiftUI

struct ContentView: View {
    @State private var situations = ["👊", "✋", "✌️"]
    @State private var correctAnswer = Int.random(in: 0 ... 2)

    @State private var scoreTitle = ""
    @State private var userScore = 0
    
    @State private var falseSituation = 0
    
    @State private var showingScore = false
    @State private var showingScoreAndTrueSituation = false

    var body: some View {
        ZStack {
            Color.cyan
            
            VStack {
                Spacer()
                Text("Rock Paper Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack {
                    Text("Select a situation and start the game")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                HStack {
                    ForEach(0 ..< 3) { number in
                        Button {
                            situationTapped(number)
                        } label: {
                            Text(situations[number])
                                .font(.system(size: 65))
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(.rect(cornerRadius: 20))
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert(scoreTitle, isPresented: $showingScoreAndTrueSituation) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)\n" + " \(situations[falseSituation]) ")
        }
    }
    
    func situationTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore = userScore + 1
            showingScore = true
        }
        else {
            scoreTitle = "Wrong"
            userScore = userScore - 1
            
            falseSituation = 0
            
            showingScoreAndTrueSituation = true
            if userScore < 0 {
                userScore = 0
            }
        }
    }
      
    func askQuestion() {
        situations.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

#Preview {
    ContentView()
}
