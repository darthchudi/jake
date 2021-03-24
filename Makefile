.PHONY: server
start:
	@bin/rails server 

.PHONY: scheduler 
scheduler:
	@bundle exec clockwork config/clock.rb

.PHONY: worker
worker:
	@bundle exec sidekiq

.PHONY: test
test:
	@bin/rails db:test:prepare && bundle exec rspec