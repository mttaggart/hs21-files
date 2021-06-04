import json
import sys

class Quiz:
    def __init__(self, json_file):
        with open(json_file) as f:
            data = json.load(f)
            self.questions = [Question(q) for q in data["questions"]]
            self.flag = data["flag"]

    def run(self):
        results = []
        for q in self.questions:
            result = q.ask()
            if result:
                print("Nice work!")
            else:
                print(q.feedback)
            results.append(result)
        if all(results):
            print("Congratulations! Here's your flag:")
            print(f"{self.flag['user']}:{self.flag['flag']}")
        else:
            correct = len(list(filter(lambda r: r, results)))
            print(f"{correct}/{len(results)} correct. Review the feedback above and try again!")

class Question:
    def __init__(self, data):
        self.question = data["question"]
        self.answer = data["answer"]
        self.feedback = data["feedback"]

    def ask(self):
        response = input(f"{self.question} ")
        return self.answer.lower() in response.lower()
