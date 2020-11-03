# :black_circle: :black_circle: :black_circle:

Try it as a docker container!
- `docker run --rm -it -v "$PWD":/workspace tanvirtin/tindev`

Supported Environments:
* :white_check_mark: Linux
* :white_check_mark: Darwin (OSX)

Prerequisites:
- Git
    - `apt-get -y update && apt-get -y upgrade && apt-get -y install git`

Manual Linux Installation:
- `git clone https://github.com/tanvirtin/dotfiles.git`
- `sudo ./dotfiles/install.sh`
- `./dotfiles/configure.sh`

Manual OSX Installation:
- `git clone https://github.com/tanvirtin/dotfiles.git`
- `./dotfiles/install.sh`
- `./dotfiles/configure.sh`
