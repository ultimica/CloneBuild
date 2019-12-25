set-variable -name DISPLAY -value 192.168.0.44:2.0
docker run  -it `
            --privileged `
            -v D:/Docker/CloneLinuxBuild/WinShare:/root/WinShare `
            --mount source=hmisrc,target=/src `
            --mount source=buildroots,target=/home/kclin/workspace/buildroot `
            --mount source=AppSettings,target=/appsetting `
            --mount source=config,target=/root/.config `
            --mount source=MiscShared,target=/miscs `
            -e DISPLAY=$DISPLAY `
            update_linux_build `
            bash -c "cd  && source WinShare/.bashrc && bash"
            #bash -c "cd  && bash"
            
            # -p 7789:7789 `
            # -v D:/Docker/Unbutu/kclin_buildroots:/home/kclin/workspace/buildroot `
            
            
            