Configuration
=============

The configuration consists of two files, ``build-config.sh`` and
``penetration-tester-config.rb``. ``build-config.sh`` holds the
configuration for the build and deploy scripts of the application
while ``penetration-tester-config.rb`` holds all configuration
relating to the execution of the application.

Build and deploy configuration
------------------------------

The ``build-config.sh`` is parsed before execution of the
``build-container.sh``, ``start.sh`` and ``deploy.sh`` script and has
two configuration variables (simple shell variables):

``DOCKER_IMAGE_NAME`` should be set to the name of the docker image
the application will run on. Executing the ``build-container.sh``
script creates an image with that name, ``start.sh`` starts a
container based on the named image and using the ``deploy.sh`` script
deploys an image with that name.

``DEPLOY_TO_SERVER`` is only used in the deploy process and should be
set to the name of the server the image will be deployed to. It may be
a SSH host alias or a hostname or an IP-address, anything SSH would
accept as connection target.

The configuration file is simply read as normal shell script before
the execution of the specific script. Any shell syntax may be
used. Comments may be introduced by starting the line with a ``#``.

Application configuration
-------------------------

All application-specific settings are made in the
``penetration-tester-config.rb`` file, which is included into the main
script, it is normal ruby code. Comments can be inserted by putting a
``#`` as the first character into the line containing the comment.

Two things need to be configured: Which servers to test and how and
where to send mails when something is found open which should not be.

Servers to test
...............

Servers to test are specified in the ``ALLOWED_OPEN_PORTS`` constant
as a ruby hash where the key is a string representing the hostname or
IP-address of the server to test and the value is an ruby array
representing all ports which should be open on this server::

    # Set which ports are allowed to be open on which servers.
    # All servers specified here are scanned.
    ALLOWED_OPEN_PORTS = {
      'host-one.example.com' => [22, 80],
      'host-two.example.com' => [8080],
      'ultra-secure.example.com' => []
    }


Sending mails
.............

When the application detects something wrong, it sends an e-mail. The three constants ``ADMIN_MAIL_ADDRESS``, ``FROM_MAIL_ADDRESS`` and ``MAIL_OPTIONS`` determine to where, from which address and how mails are sent::

    # the email address error messages should be send to
    ADMIN_MAIL_ADDRESS = "admin@example.com"

    # the from address of the mails
    FROM_MAIL_ADDRESS = "backup-checker@example.com"

    # the settings for sending mails
    # (see via_options-Hash of Pony https://github.com/benprew/pony)
    MAIL_OPTIONS = {
      :address              => 'smtp.example.com',
      :port                 => '587',
      :user_name            => 'username',
      :password             => 'password',
      :authentication       => :login, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost" # the HELO domain provided by the client to the server
    }
