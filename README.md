# Rails' Capstone Project

> In this project I build a web app called 'BarHops' where the user can count how many times has visited a certain bar and then group them by categories or 'groups'.
Also, I followed the given design which is [Snapscan](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=) and I changed the content.

The main objective was to build an MVP (Minimum Viable Product) version of the app following business requirements.

Here is the user journey for the app:
1. The user logs in to the app, only by typing the username.
2. The user is presented with a profile page that includes links to:
  * "All my transactions".
  * "All my external transactions".
  * "All groups".
3. When the user opens "All my transactions" page:
  * Total amount is displayed at the top.
  * A list of all transactions created by the logged-in user is displayed (sorted by most recent).
  * Each transaction displays its name, amount and date, and an icon of the group it belongs to.
  * An action button "Add new" is displayed.
4. When the user opens "All my external transactions" page (see the *Transactions list page* screenshot above):
  * A list of all transactions that are created by a logged-in user but **not assigned to any group** (sorted by most recent).
  * The design of the page is similar to the "All my transactions".
5. When the user opens "All groups" page:
  * A list of all groups is displayed (example ideas for names: "Kitchen renovation", "Books, music & culture", "Car maintenance") in alphabetical order.
  * Each group displays its icon, name, and creation date.
  * Each group is clickable and opens the "Group transactions" page.
  * An action button "Create new" is displayed.
  * The design of the page is similar to the "User profile page"
6. When the user opens the "Group transactions" page:
  * A list of all transactions that belong to that group is displayed.
  * The design of the page is similar to the "All my transactions". Besides the information that appears in All my transactions page, each transaction displays the **name of the author** of the transaction.
7. When the user opens "Create new group" or "Add new transaction" page:
  * A form with all necessary fields is displayed.
  * It's not in the given design, but you should make an effort to follow the same style of the other pages.

## Screenshot
![screenshot]()

## Live Demo

You can try it [here]().

## :hammer:  Built With
- Ruby 2.7,
- Rails 5.2.4,
- Bootstrap 4.5,
- Rspec 3.9,
- Capybara 2.15,
- Shoulda-matchers 4.0,
- Webdrivers 4.0,
- Rubocop 0.79.0

## :computer: Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
You need to install:
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) language.
- [Rubygems](https://rubygems.org/pages/download).
- [Rails](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails).
- An IDE (Integrated Development Environment).

### Setup
1. Clone the repository.
2. In your OS terminal search the repository's address and to install gems run:  
  $ `bundle install`   
3. To setup database
  $ `rails db:create`
  $ `rails db:migrate`   
3. Then start Rail's server   
  $ `rails server`   

### Usage
- Open `http://localhost:3000/` in your browser.
- Follow the instructions.

### Run tests
Unit tests for:  
- Models Associations.  
- Models Validations.  

Integration tests for:
- Authentications.
- Attendances.  
- Groups.

In your terminal search the repository's address and run:  
  $ `rspec --format documentation`   
  It will provide you well-organized output on your terminal with information about the tests.

### Deployment
To deploy on Heroku you can check [this](https://www.theodinproject.com/courses/ruby-on-rails/lessons/preparing-for-deployment) tutorial from the Odin Project.

After pushing the last changes to the remote repository, follow this steps:
1. $ `heroku create`
2. $ `git remote`
3. Verify that you see heroku in the output. 
4. $ `git push heroku master`  
   This will push the master branch.  
   In case you want to push anothe branch you can run   
   $ `git push heroku <branch name>:master` 
4. Migrate the database on Heroku  
   $ `heroku run rails db:migrate` 
5. Open the app  
   $ `heroku open` 
   

## :gem:  Features
* Users can create an account.
* Users can upload a profile picture.
* Validates user name.
* To login is necessary to submit the name.
* The user can create attendances and groups.
* When creating a group can add name and a picture.

## :woman:  Author

**Rossiel Carranza**

- Github: [@RossielCS](https://github.com/RossielCS)
- Linkedin: [Rossiel Carranza](https://www.linkedin.com/in/rossiel-carranza/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give an ⭐️ if you like this project!

## Acknowledgments
Design idea by [Gregoire Vella](https://www.behance.net/gregoirevella) on Behance.

## 📝  License

This project is [MIT](lic.url) licensed.
