This code participated in Aquasoft Clean Code Cup 2012

Automated Teller Machine
  The application is a prototype of well-known ATM equipment. The work process is highly simplified and includes only base operations. 
  Start work with ATM inserting your bank card by command INSERT, enter an appropriate card's PIN (default is 1234). It's available to check current card's balance by command BALANCE or obtain some cash by entering correct sum. Return to the menu by command BACK. Quit from the terminal by command EXIT.
	
Requirements:
  Ruby 1.9.3 
    Download installation file from http://rubyinstaller.org/downloads/
    During install process select option to add the location of ruby executables to system variable PATH

Additions:
 Bundler 1.1 ruby packages manager for test suite
    This software can be installed by command 'gem install bundler'. 

    Note:
    If internet connection is not accessible on the workstation, download necessary package from http://rubygems.org/ and run command 'gem install --local c:\Path_To_Gem\package_name.gem'.


Tests:
  All test specifications are located in files features/*.feature.
  Install required packages for tests by command 'bundle install'.
  Run tests by command 'rake features'.

  In order to get colored output on Windows:

	1. Download and unzip the file from https://github.com/adoxa/ansicon/downloads
	2. Open cmd and navigate to the unzipped folder
	3. Navigate to x64 (if you have a 64 bit machine) otherwise navigate to x86
	4. Type ansicon.exe -h and you will get the following:
		D:\Data\ansicon\x86>ansicon.exe -h
		ANSICON by Jason Hood.
		Version 1.52 (02 June, 2012).  Freeware.
		http://ansicon.adoxa.cjb.net/
	5. Execute 'ansicon.exe -i' to install and add ansicon to your Windows
	6. Run cucumber test and you should get the colored output result on Windows
