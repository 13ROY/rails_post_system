# rails_post_system
Ruby On Rails Postal Database
`Ruby 2.2.3`
`PostgresSQL`

## To Do:
- ~~Create a PostGresSQL database/user and schema~~
- ~~Download PostGresSQL~~
- Download Jenkins
- ~~Download Flyway~~
- Download Vagrant
- Download puppet (or similar) to automate  program installation
- Create A Maven Project (For automation ease)
- Add tests (using Cucumber) to check the schema
- Automate install/tests using Jenkins
- ~~Add CircleCI to repository~~ and install various frameworks and run tests on commit to repo as follows:
-- simplecov - code coverage
-- rubocop - ruby code quality

## Troubleshooting code errors:
Run the following command in the project root
 - rubocop --auto-gen-config
You should now have a file called 'rubocop_todo.yml'
Add the line to the rubocop.yml file
 - inherit_from: .rubocop-todo.yml
Run the tests and clean all the errors
rake testcode