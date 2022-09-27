# 1. Team member names and UNIs

Member 1 Name: Ari Jiang (yj2627)

Member 2 Name: Gefei Zhang (gz2315)

Member 3 Name: Liang-yu Chen (lc3533)

Member 4 Name: Xijiao Li (xl2950)

# 2. Summary of the app's features 

## 2-1. 1st Iteration

The app has three main pages: home page, user profile and review survey. 

On the home page, we can search for an user by his UNI. If a blank search is submitted or the UNI is invalid, an error message will pop up. Once the searching result shows up, we can click on "More about [name]" to go to his user profile, where we can see all the reviews from his previous teammates. To add a new review for this user, we can click on the "Add A Review" button to submit a new one and the new review will show up on the user's profile after submission.


## 2-2. 2nd Iteration

New features: login/logout, user detail update, general skills and radar chart, other skills and endorsement

On the login page, the user can type in his columbia email address to receive the login link by email. Then, he can update his personal information, such as name, program, on his profile, by clicking it. On the profile page, users' five general skills are shown in a radar chart, where we can see his self-evaluation and also the average peer-evaluation from other users. In the other skill part, users can add skills that they want to highlight for this person and endorse skills.


## 2-2. 3nd Iteration

Updates: web design, user detail update, review form


# 3. Instructions to run and test the product

### To run
Git clone this repository into your local target folder. 

In terminal, cd into ```$Rate_my_teammate/rate_my_teammate```. 

Run ```bundle exec rake db:migrate``` and ```bundle exec rake db:seed``` to create database.

To start local server, please run ```rails s -b [IP] -p [PORT]```. 

Then open up your server and navigate to your specified IP and port. You should be able to see the web app.

### To test
Make sure you stay in the ```rate_my_teammate``` directory. 

Before running any test, run ```bundle exec rake db:test:prepare```.

To run integration test, type ```bundle exec rake cucumber``` in terminal.

To run unit test, type ```bundle exec rake spec``` in terminal. 

# 4. Heroku deployment link

https://fast-ocean-87354.herokuapp.com/

# 5. Github repo link

https://github.com/XijiaoLi/Rate_My_Teammates

