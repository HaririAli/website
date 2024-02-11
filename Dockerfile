FROM ruby:3.0-slim-bullseye

WORKDIR /site

RUN apt-get update && apt-get install -y build-essential

RUN gem install bundler

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--port", "4000", "--host", "0.0.0.0", "--watch", "--force-polling"]