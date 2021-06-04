import sys
from quizengine import Quiz

def main():
    try:
        quiz_file = sys.argv[1]
    except:
        print("Could not load quiz file")
    quiz = Quiz(quiz_file)
    quiz.run()

if __name__ == "__main__":
    main()
