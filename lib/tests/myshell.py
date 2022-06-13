def command(command):
    exit_status = os.system(
        "echo \"%s\" | ./42sh > output 2> errout" % command)
    with open("output", "r") as output_file:
        output = output_file.read()
    with open("errout", "r") as error_file:
        error = error_file.read()
    return output, error, exit_status / 256


out, err, ex = command("ls -a") 