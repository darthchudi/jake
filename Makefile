.PHONY: start
start:
	@bin/rails server 

.PHONY: test
test:
	@bin/rails db:test:prepare && bundle exec rspec