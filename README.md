# Team Lunch Application Twitter Bootstrap for Rails 4, 3.x Asset Pipeline
Team lunch is a simple application which involves the setting up of several models in order to streamline the order process. It should be noted that a few considerations were made when coming up with this design. It is more complex than otherwise could have performed, I realize this but wanted to push my understanding of ruby & rails concepts hence the extra complexities.

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
```ruby

### Run the application

```ruby
rails s
```ruby

## Alternative Solutions

```
Current solution:

Team 1..n Members
  Members 
    -> 1 dietary restriction from %w( 'Fish free', 'Gluten free', 'Lactose free', 'Nut free', 'Vegetarian', 'None' ) 

Restaurant 1..n Stock

  Restaurant
    -> rating 1..5
    -> unique constraint on stock & dietary restriction
  Stock
    -> quantity
    -> dietary restriction 1 from %w( 'Fish free', 'Gluten free', 'Lactose free', 'Nut free', 'Vegetarian', 'None' )

Order & Restaurant 1..n Meals
  Order 
    -> Order date (cannot be in past)
  Meals
    -> quantity
    -> dietary restriction

Basic premise here, is that for a given date (order date) all meals on that date currently stored in the database should negate the corresponding stock for the restaurant. If suffient stock exists after this check is made the order will proceed and the meals will be generated.
```