# https://docs.docker.com/engine/reference/builder/#from
FROM ubuntu:18.04

# https://help.ubuntu.com/lts/serverguide/apt.html
RUN apt update
RUN apt -y upgrade

# Install python3
# https://help.ubuntu.com/community/AptGet/Howto#Installation_commands
RUN apt install -y python3

# Install pip3 to install python packages
RUN apt install -y python3-pip

# https://docs.docker.com/engine/reference/builder/#copy
COPY requirements.txt .

# Install python packages
# https://pip.pypa.io/en/stable/reference/pip_install/#usage
RUN pip3 install -r requirements.txt

# Create notebooks directory
RUN mkdir /home/notebooks

CMD jupyter lab --no-browser --ip 0.0.0.0 --port 8888 --allow-root /home/notebooks