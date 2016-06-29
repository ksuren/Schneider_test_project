QA Engineer Test
----------------

Part 1
------
Complete the online interview questionnaire at
http://goo.gl/forms/8CzUbADlF0sgTKTJ3

Part 2
------
Create automation testing for a hybrid native android app, which is built using Ionic Framework (including AngularJS + Cordova)

Step 1 - Install and walkthrough the app
----------------------------------------
> Download and install the provided apk file on to a Android Phone v5.0 and above.
> Login to app using demo@demo.com/demo credentials 
> navigate to about screen and observe the product-id and serial # values (mockup-data)
> navigate to left nav and logout.

Step 2 - Write automation testing to walkthrough the app
--------------------------------------------------------
Create automation scripts to simulate the above workflow
1. login to the app
2. navigate to "About" page
3. read product-id and serial-number values
4. print the values on console/log 
5. logout

Step 3 - Submission Guidelines
------------------------------

- Document your results and automation test procedure.
- Upload the completed work to a Github public repository.
- Send the github repository link and documented results to recruiter.


General Guidelines
------------------
- Document any assumptions/constraints. 
- When in question, pick a choice and document the assumptions.
- The candidate is free to choose any combination of automation tools/procedures/methodologies.
- There are many tools/ways exist in the market today to perform mobile hybrid app automation. One sample reference is: http://tombuyse.com/end-to-end-testing-an-ionic-application-with-appium-and-protractor/. But you are welcome to choose any tooling/procedure/methodology of your choice.
- Document the tooling used, test procedure and results.



Scripting from Surendra:
--------------------------
Tools Used: Seetest,VB

Scenario: 
	1. Login to the app with the given credentials
	2. Read the data from about and logout the app

Note: I didn't consider any negative flows wher user fails to login or failed to do graceful logout.






