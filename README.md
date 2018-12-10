Example app to reproduce [graphiti-api-/graphiti issue#56](https://github.com/graphiti-api/graphiti/issues/56)

Instructions:

```bash
# Clone the repo
git clone https://github.com/hector/graphiti-issue-56.git
cd graphiti-issue-56

# Initialize the application
bundle install
bundle exec rake db:setup

# Run the server
bundle exec rails server

# On a different shell:
# Run the failing example
bundle exec rake issue56
```

The code to trigger the failing example is found at `lib/tasks/issue56.rake`.