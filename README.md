# Getting-Cleaning-Data-Project
This is my project submission for the Coursera 'Getting and Cleaning Data'

1. The study data for this project is from  
	Smartlab - Non Linear Complex Systems Laboratory                                                                      
	ITEN - Università degli Studi di Genova.                                                                               
	Via Opera Pia 11A, I-16145, Genoa, Italy.                                                                               
    
2. Further information on the study the files and description of the variables is found in the Code Book of this repository.
3. The files necessare for my project are scattered throughout a folder stucture when the zip file (named in the Code Book) is downloaded
4. It is necessary to copy the file over to a './data/' folders that the 'run_analysis.R' script has access to.
5. The seven *.txt files from the are named in the Code Book markdown file.
	The train files should be located in:

		"./data/train/y_train.txt"  subject labels (Activity index)	                             			
		"./data/train/X_train.txt"  measurement data
		"./data/train/subject_train.txt' Subject name index
		
	The test files should be located in:	
	
		"./data/test/y_test.txt"    subject labels (Activity index)							
		"./data/test/X_test.txt"    measurement data
		"./data/test/subject_test.txt" Subject name index
		
	The description descriptive names of the values measured.
    	The text file that names the 561 measurements being record:
    	
		"./data/features.txt" 

6. The analyst should copy the 'run_analysis.R' file to their Working Directory, with the './data' directory and files below.
7. The 'run_analysis.R' can be sourced to run all the steps at once.
8. Or, alternatively, the file could be opened and each step run individually.
9. The result is the tidy data data.frame, TidyData
9. Ad CodeBook.md markup file is included in this repo that describes the variables and other information (based on Getting and Cleaning Data video)


 
