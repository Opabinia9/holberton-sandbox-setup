### Hello all,  
this is a script i made to set up the holberton school sandboxes just the way i like  
AND NOW!  
i have made the install script userfriendly (probably :)  
so using the command bellow it you should be able to use it  
``source <(wget -qO- https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/install.sh)``  
or  
``wget -q https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/install.sh``  
if you want to download it and change a few things before running  

> [!WARNING:]  
> to be clear this script and setup has only been tested and use on the Holberton School Ubuntu sandboxes,
so if you are not useing it on that it's behavoure may be unpreditable.
that said, feel free to download it, and change it to fit you needs, have fun  
enjoy

---
## Features:
### V 1.0.0: 
    - [x] Git Promt for:
      - [x] untracked files
      - [x] staged files
      - [x] modified files
      - [x] commits ahead & behind of remote
    - [x] prompt for background jobs
    - [x] rmdf function to remove the defualt folders and files
### V 1.0.1: 
    - [x] newtask function - creates a new c file with a basic setup, to use it pass the
          file name and function prototype space seperated and enclosed in double qutes:
          newtask "func.c" "int func(int s, int n)"
### V 1.0.2:
    - [x] added AGE function to prompt: after 3.5 hours will print a red warning,  
          reset with AGE RESET
## TODO:  
    - [ ] Add auto started timer  
    - [ ] add diffrent colors to git prompt
    - [ ] add vimrc
--- 

![asciinema]( https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/holbyV1.gif)  
