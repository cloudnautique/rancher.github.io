FROM ruby:2.2
ADD . /site
RUN useradd --system -M jekyll && \
    chown -R jekyll:jekyll /site && \
    cd /site && \
    bundle install && \
    bundle exec jekyll build 

WORKDIR /site
USER jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--no-watch", "--host", "0.0.0.0", "--skip-initial-build"]
