## Contacts Lab with Email and Sidekiq

The goal of this lab is to create a simple rails app that can send emails.  In order to do this, you're going to create a backend api (a separate rails app) that  has the ability to send emails.

### Contacts App

The front end app is already given to you in this repo under the `contacts_front_end` directory.  Most of the code is done.  You just need to implement 3 methods in the controller to get an email from the user.  Your contacts front end should send api request to the app in the `email_sender` directory.

### Email Sender App

In the email sender app, you should only have 1 api to worry about.  The request you will make will be a post request to `/email`.  The `/email` api should be called using `/email.json` from your front end since that is the format you want your server to respond with. The email api will need 3 pieces of information:

* email address for the To field of the email
* subject of the email
* body of the email

#### Sidekiq

We want our api to respond to our rails front end quickly.  Therefore the email sending should happen in a sidekiq worker.   Start out having your code in the controller, then once you get it working, move it to a worker.

#### Emailing

Use action mailer to send your email.  



#### Hints

* To get both servers running at the same time, you can run one of the servers on a different port.  The command for that is:

```
rails s -p 3001
```

* Don't worry about sidekiq, emailing or anything else at first.  Just get one server talking to another.  Add the code in your front end that makes an api request to your back end.  Veryify that your back end gets data.
* Make sure to change your back end to `protect_from_forgery with: :null_session` in `app/controllers/application_controller.rb`.
* When you get to implementing the worker, just give the worker the email address, subject and body as parameters to the worker.  It does not make sense for you to save the data in the database.

