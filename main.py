from website import create_app

app = create_app()

if __name__ == '__main__':  # if we run the file it starts
    # debug mode: every time we change it restarts the server
    app.run(debug=True)
