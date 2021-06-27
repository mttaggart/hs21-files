use std::net::{TcpListener, TcpStream};
use std::io::{BufRead, BufReader, BufWriter, Write};

struct BufTcpStream {
    stream: TcpStream,
    rx: BufReader<TcpStream>,
    tx: BufWriter<TcpStream>
}

impl BufTcpStream {
    pub fn new(stream: TcpStream) -> Self {
        BufTcpStream {
            rx     : BufReader::new(stream.try_clone().unwrap()),
            tx     : BufWriter::new(stream.try_clone().unwrap()),
            stream : stream
        }
    }
}

fn check_login(login: &String) -> bool {
    
    let check_str = String::from("<<USERNAME>>:<<PASSWORD>>");
    let trimmed = login.replace("\n", "");
    trimmed == check_str
}

fn handle_client(mut socket: BufTcpStream) {
    let mut login = String::new();
    let flag = String::from("<<NEXT_USER>>:<<FLAG>>\n");
    socket.rx.read_line(&mut login).unwrap();
    
    if check_login(&login) {
        socket.tx.write_all(flag.as_bytes()).unwrap();
    } else {    
        socket.tx.write_all(b"login failed!\n").unwrap();
    }
    socket.stream.flush().unwrap();
    
}

fn main() -> std::io::Result<()> {
    let listener = TcpListener::bind("127.0.0.1:9999")?;
    for stream in listener.incoming() {
        let socket = BufTcpStream::new(stream.unwrap());
        handle_client(socket);
    }
    Ok(())

}
