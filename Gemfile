source :gemcutter

# bundler requires these gems in all environments
gem "rails", "~>2.3.9"
gem "metric_fu", "~>1.1", :require => "metric_fu"
gem "will_paginate", "~>2.2"
gem "erubis", ">=2.6.5"
gem "paperclip", ">=2.3"
gem "formtastic", "~>0.9"
gem "authlogic", "~>2.0"
gem "searchlogic", "~>2.3", :require => "searchlogic"
gem "matthuhiggins-foreigner", :require => "foreigner"
gem "mysql"
group :development do
  # bundler requires these gems in development
  gem "annotate", :require => "annotate"
  gem "query_trace", :require => "query_trace"
  #gem "query_trace", :require => "query_trace", :git => "http://github.com/ffmike/query_trace.git"
  gem "bullet"
  gem "inaction_mailer", :require => "inaction_mailer/force_load"

end

group :test do
  # bundler requires these gems while running tests
  gem "test-unit"
  gem "shoulda", :require => "shoulda"
  gem "mocha", ">=0.9.7"
  gem "webrat"
  gem "test_benchmark", :require => "test_benchmark"
  #gem "test_benchmark", :require => "test_benchmark", :git => "http://github.com/ffmike/test_benchmark.git"
end
