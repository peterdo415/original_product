FROM ruby:3.2.2
ARG RUBYGEMS_VERSION=3.3.20
RUN mkdir /product
WORKDIR /product
COPY Gemfile /product/Gemfile
COPY Gemfile.lock /product/Gemfile.lock
RUN bundle install
COPY . /product

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
