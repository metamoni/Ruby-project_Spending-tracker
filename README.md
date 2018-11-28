This is a web application that tracks your spendings, built with Ruby, Sinatra, and PostgreSQL.

I completed this solo project after just four weeks at CodeClan, an SQL certified coding bootcamp in Edinburgh. You can read the full brief here.

As a former marketing writer, this was a fun project for me. While useful, financial apps can be pretty dry and boring. So I decided to turn my spending tracker (which is basically a calculator with the added ability to save your transactions) into an app that would make people laugh every day. You can see how I did that (or tried to) by reading the main page.

Design process:
I used proto-personas to try and figure out who this app is for and what the user needs are. I used pen and paper to sketch my wireframes, models, and views. Using the MoSCoW method, I made a detailed list of tasks and tracked my progress with Trello. I used basic CSS styling because I wanted to focus more on functionality than looks.

What I learned:
By the end of the project, I learned that referring back to original plans helps you keep focused. I probably didn't stick to my plans and tasks as strictly as I should have. And while experimenting with code is very tempting, my focus should have been on finishing the basics before moving on to more complicated things.

Thoughts after the project:
Looking back at this code now, it's very tempting to go back and fix things or add some more functionality. I'm confident that, with what I know now, I could go back and improve it. But for now, I'm happy to have this as a reminder of how much I accomplished after just four weeks of learning.


What works:
add categories, merchants, and transactions
edit categories, merchants, and transactions
delete categories, merchants, and transactions
calculate total spendings
display remaining budget
display personalised messages, based on amount spent


What I would change, add, or do differently:
add timestamps
store user details in the database
display purchases by amount (low-high, high-low) - the methods are already there in the code, but I haven't managed to implement this functionality before the deadline


To run the app:
- make sure you have Ruby and Sinatra installed
- run ruby app.rb in your Terminal
- run psql -d spending_tracker -f db/spending_tracker.sql
- run ruby db/seeds.rb to populate the database
- go to http://localhost:4567/ in your browser to open the app
