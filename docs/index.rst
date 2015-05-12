.. Penetration Tester documentation master file, created by
   sphinx-quickstart on Tue May 12 14:14:39 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Penetration Tester's documentation!
==============================================

This little ruby script uses *nmap* to scan hosts for open ports and
compares the ports found open with a list of allowed open ports. If
there are ports found open which are not in the list of allowed open
ports, it sends a mail.

It is useful when run periodically against your servers to check if
the firewalls are still configured properly.

It is intended to be called by a cron job to check server
periodically. Which servers and ports to check and how to send an
email is configured in ``config.rb``::

    # Set which ports are allowed to be open on which servers.
    # All servers specified here are scanned.
    ALLOWED_OPEN_PORTS = {
      'host-one.example.com' => [22, 80],
      'host-two.example.com' => [8080],
      'ultra-secure.example.com' => []
    }

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

Features
--------

- Can check as many ports on as many servers as you wish.
- Intended to be used as docker container, resulting in no
  dependencies which needs to be installed.

Installation
------------

See :doc:`quickstart` for detailed installation instructions.

Contribute
----------

- Issue Tracker: `github.com/SKoschnicke/penetration-tester/issues
  <https://www.github.com/SKoschnicke/penetration-tester/issues>`_
- Source Code: `github.com/SKoschnicke/penetration-tester
  <https://www.github.com/SKoschnicke/penetration-tester/>`_

Support
-------

If you find bugs, please report them in the `issue iracker
<https://www.github.com/SKoschnicke/penetration-tester/issues>`_. You
may also reach me by email: s.koschnicke@gfxpro.com

**Please do not report security-related bugs on the issue tracker** as
issues created there are instantly publicly available. Instead, send
me an email: s.koschnicke@gfxpro.com. My GPG-keys can be found on
`Keybase <https://keybase.io/skoschnicke>`_.

License
-------

The project is licensed unter the MIT license. The the included
`LICENSE.txt
<https://github.com/SKoschnicke/penetration-tester/blob/master/LICENSE.txt>`_
for details.

Contents
========

.. toctree::
   :maxdepth: 2

   quickstart

Indices and tables
==================

* :ref:`genindex`
* :ref:`search`

