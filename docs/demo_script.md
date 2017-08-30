docker pull asciinema/asciicast2gif
alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'
asciicast2gif -t solarized-dark testdrive testdrive.gif
ctrl-k

asciinema rec testdrive

picobox install
mkdir -p Code/rails
cd Code/rails
picobox init rails
picobox build
picobox start
the gems will be installed into picobox not on host
gem install rails --no-ri --no-rdoc
gem list | grep rails
cd ..
gem list | grep rails
look ma no rails on host!
cd rails
rails new .
rails c
rails s
rake -T
picobox stop
rails s
no picobox, no rails, host clean