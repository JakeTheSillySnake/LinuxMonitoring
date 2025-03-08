# LinuxMonitoring
_Simple bash scripts for Ubuntu system overview. Last edited March, 2025._

<br/>

To run either of the scripts, go to the corresponding folder and run `chmod +x ./main.sh`. After that, you can successfully run the `./main.sh` script. The scripts were written and tested on Ubuntu 22.04, so their behaviour may differ on other Unix distributors.

**IMPORTANT:** directory overview requires admin (sudo) priviliges; if you'd like to run the script without them, simply remove any mention of `sudo` from the commands.

## Part 1. System overview

The script can be found in the `src/sys_overview` folder and is run without arguments. It outputs the following information:

**HOSTNAME** = _host name_  
**TIMEZONE** = _time zone as: **America/New_York UTC -5**_  
**USER** = _current user who ran the script_  
**OS** = _type and version of operating system_  
**DATE** = _current time as: **12 May 2020 12:24:36**_  
**UPTIME** = _system uptime_  
**UPTIME_SEC** = _system uptime in seconds_  
**IP** = _ip address of the loopback interface_
**MASK** = _network mask of the loopback interface as: **xxx.xxx.xxx.xxx**_.  
**GATEWAY** = _default gateway ip_  
**RAM_TOTAL** = _main memory size in GB with an accuracy of three decimal places as: **3.125 GB**_  
**RAM_USED** = _used memory size in GB with an accuracy of three decimal places_  
**RAM_FREE** = _free memory size in GB, with an accuracy of three decimal places_  
**SPACE_ROOT** = _root partition size in MB, with an accuracy of two decimal places, as **254.25 MB**_  
**SPACE_ROOT_USED** = _size of used space of the root partition in MB, with an accuracy of two decimal places_  
**SPACE_ROOT_FREE** = _size of free space of the root partition in MB, with an accuracy of two decimal places_

The script uses the following colour designations: 1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black. These values are assigned in the `colors.conf` file as follows:

**column1_background** is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**column1_font_color** is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**column2_background** is the background of the values (after the '=' sign)  
**column2_font_color** is the font colour of the values (after the '=' sign)

When configuring the file, make sure the font and background colours of one column don't match. If one or more parameters are not set, the colour will be substituted from the default colour scheme.

After the system information output, the colour scheme is shown as follows:
```
Column 1 background = 2 (red)
Column 1 font color = 4 (blue)
Column 2 background = 5 (purple)
Column 2 font color = 1 (white)
```

When running the script with the default colour scheme, the output will look like this:
```
Column 1 background = default (black)
Column 1 font color = default (white)
Column 2 background = default (red)
Column 2 font color = default (blue)
```

## Part 2. File system overview

The script can be found in the `src/dir_overview` folder and is run with a single parameter, which is an absolute or relative path to a directory. The parameter must end with '/', for example: `./main.sh /var/log/`

The script outputs the following information about the directory specified in the parameter:
- Total number of folders, including subfolders
- Top 5 folders with largest size in descending order (path and size)
- Total number of files
- Number of configuration files (with .conf extension), text files, executable files, log files (files with .log extension), archives, symbolic links
- Top 10 files with largest size in descending order (path, size and type)
- Top 10 executable files with largest size in descending order (path, size and hash)
- Execution time of the script in seconds

Output example:

```
Total number of folders (including all nested ones) = 6  
TOP 5 folders of maximum size arranged in descending order (path and size):  
1 - /var/log/one/, 100 GB  
2 - /var/log/two/, 100 MB  
etc up to 5
Total number of files = 30
Number of:  
Configuration files (with the .conf extension) = 1 
Text files = 10  
Executable files = 5
Log files (with the extension .log) = 2  
Archive files = 3  
Symbolic links = 4  
TOP 10 files of maximum size arranged in descending order (path, size and type):  
1 - /var/log/one/one.exe, 10 GB, exe  
2 - /var/log/two/two.log, 10 MB, log  
etc up to 10  
TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):  
1 - /var/log/one/one.exe, 10 GB, 3abb17b66815bc7946cefe727737d295  
2 - /var/log/two/two.exe, 9 MB, 53c8fdfcbb60cf8e1a1ee90601cc8fe2  
etc up to 10  
Script execution time (in seconds) = 1.5
```
