Personal [Gentoo] overlay

© 1999–2016 Gentoo Foundation

Setup
-----

Create `/etc/portage/repos.conf/tagae.conf` containing

    [tagae]

    location = /usr/local/portage/tagae
    sync-type = git
    sync-uri =  https://github.com/tagae/tagae-gentoo-repo
    auto-sync = yes

The `tagae` repo will be created the next time you sync your repositories.  You
can request the syncing explicitly with the command

    emaint sync --repo tagae

Once you have synced the repo, you can proceed to install any of the packages
it contains.

To avoid unmasking each package you wish to install, you can unmask all
packages at once by creating `/etc/portage/package.accept_keywords/tagae` with
content

    */*::tagae ~amd64

[Gentoo]: http://www.gentoo.org
