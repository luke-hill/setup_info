To pull from a remote repo i.e. with a gem looking like this

gem 'private_gem', :git => 'git@git.COMPANY-NAME.com:company-github-name/private_gem.git'

Alter your dockerfile to look something like this

```
RUN gem install bundler -v 1.17.3 && \
    apt-get install ssh -y --force-yes && \
    mkdir -p -m 0600 ~/.ssh &&  \
    ssh-keyscan git.COMPANY-NAME.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh bundle install
```

