use std::fs;
use std::process::Command;

fn main() -> std::io::Result<()> {
    let flag = "<<FLAG>>";
    let username = "<<NEXT_USER>>";
    let nginx_path = "/usr/sbin/nginx";
    let html_test = String::from("<html>
    <head>
        <title>You did it!</title>
    </head>
    <body>
        <h1>Congrats! Your website is live!</h1>
    </body>
</html>
");

    println!("===Commencing Test===");

    match fs::metadata(nginx_path) {
        Ok(_)  => { println!("[+] Found nginx") },
        Err(_) => { 
            println!("[-] nginx not found");
            println!("[?] How do we install packages?");
        }
    };

    let html_out = Command::new("curl")
        .arg("http://localhost:8080")
        .output()
        .expect("[!] Could not run curl");
    
    let out_string = String::from_utf8(html_out.stdout).unwrap();
    
    if html_test == out_string {
        println!("[+] Nginx points to correct file");
        println!("[+] Congrats! Heres a flag: {}:{}", username, flag);
    } else {
        println!("[-] Nginx server does not seem to point to the right file!")
    }

    Ok(())
    
}