# Team Lunch Application
Team lunch is a simple application which involves the setting up of several models in order to streamline the order process. 
It should be noted that a few considerations were made when coming up with this design. 
It is more complex than otherwise could have performed, I realize this but wanted to push my understanding of ruby & rails concepts hence the extra complexities.

## Installation
#### Installing and running team lunch application

## Download the application

```ruby
git clone https://github.com/daroleary/team_lunch
bundle
```
### Setup the database

```ruby
rake rspec db:migrate
rake rspec db:populate
```

### Run the application

```ruby
rails s
```