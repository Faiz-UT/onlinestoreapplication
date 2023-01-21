FROM ruby:2.6.0

RUN apt-get update -yqq \
&& apt-get install -yqq --no-install-recommends \
postgresql-client \
nodejs \
qt5-default \
libqt5webkit5-dev \
&& apt-get -q clean \
&& rm -rf /var/lib/apt/lists

WORKDIR /user/src/app
COPY Gemfile ./
RUN bundle install
COPY . .

#RUN chmod 755 ./bin/docker-entrypoint
#ENTRYPOINT ["./bin/docker-entrypoint"]
#CMD ["./bin/rails","db:create db:migrate db:seed"]
# CMD ["./bin/rails","db:create"]
# CMD ["./bin/rails","db:create"]


#EXPOSE 3000
# # CMD ["bash"]
#CMD ["./bin/rails", "server"]


#CMD bundle exec unicorn -c ./config/unicorn.rb
