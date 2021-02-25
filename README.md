# Dockerized Sudoku Solver
## About
This is a dockerization of [spr332/Flask-Sudoku-Solver](https://github.com/spr332/Flask-Sudoku-Solver "spr332/Flask-Sudoku-Solver") which is a front end for [spr332/CS4613-Project-2-SP19-SPR332](https://github.com/spr332/CS4613-Project-2-SP19-SPR332 "spr332/CS4613-Project-2-SP19-SPR332") which is a sudoku solver that I made for an Artificial Intelligence class in the spring of 2019.
## Usage
Run with `docker run --rm -p <port>:<port> sudokusolver` the default port is 45001
## Setup
It is recommended that you change the secret key for the wsgi; to do this, one should edit the enviorment variable in the dockerfile.
The default port for this is 45001, to change this edit the port in ports.conf file.
All changes must be done before building the dockerfile.
Finally, build the docker container with `docker build -t sudokusolver .`