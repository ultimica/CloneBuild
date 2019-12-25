FROM ubuntu:bionic

# RUN dpkg --add-architecture i386
RUN apt-get update && \
    apt-get upgrade -f -y 

RUN apt-get install git -f -y  \
    bash \
    build-essential  \
    python \
# RUN apt-get install qemu -f -y 
    p7zip-full \
    vim \
    libc6-i386

# RUN apt-get install snapd -f -y 

# RUN mkdir /MySpace
# RUN mkdir /WinShare

RUN apt-get install -y curl gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget



RUN mkdir -p /home/kclin/workspace/buildroot && \
    mkdir -p /root/WinShare && \
    mkdir /MySSHKey  &&\
    chmod -R 400 /MySSHKey


RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&\
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ &&\
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&\
    apt-get install apt-transport-https -y &&\
    apt-get update &&\
    apt-get install -y code 

RUN apt-get install -y systemd rsync

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386


COPY ./.ssh /MySSHKey