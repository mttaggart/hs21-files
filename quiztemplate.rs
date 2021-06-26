use std::process::{Command, Stdio};

fn main() {

    let quizengine_binpath = "<<QUIZENGINE_BINPATH>>";
    let quizfile = "<<QUIZFILE>>";

    //let quizengine_binpath = "quizengine/bin/quizengine";
    //let quizfile = "levels/start0/quiz.json";

    Command::new(quizengine_binpath)
        .arg(quizfile)
        .stdin(Stdio::inherit())
        .stdout(Stdio::inherit())
        .output()
        .expect("Could not run quizengine");

}
