FROM ruby:2.2-onbuild

RUN apt-get update
RUN apt-get install -y nmap

ENTRYPOINT ["./pentest.rb"]
