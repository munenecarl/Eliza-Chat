# ElizaChatV3

This is a project to provide anonymous mental health counselling to students at my University. The model used is Text-Bison from Google's PalmAI 

#### Directions on use
  * Clone the repo locally on your computer.
  * Import depandicies using the mix.exs using the mix deps.get command.
  * Ensure that you have set <code>DB_USERNAME</code>, <code>DB_PASSWORD</code> and <code>API_KEY</code>. (Remember that the project uses the postgres DBMS and that to get the API_KEY, visit Google makersuite to get a new model.)
  * Run the server using the mix phx.server.
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

#### Disclaimer !!!
 * The project is not yet done, I am yet to truly fine-tune the model to ensure that it exclusively answers mental health questions, this is to be done in the future.
 * I'll deploy the project for better demonstration.
 * This web app is in no means meant to serve as a complete substitute for proffessional help for people with mental health issues.
