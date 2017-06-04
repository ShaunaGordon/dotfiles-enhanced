# WHY HAS NO ONE DONE THIS?!

Seriously, it seems so simple. I put pretty much the same software and have the same settings across most of my computers. I already use provisioners on my servers (hell, a good portion of people do it with their servers nowadays, at the very least, they're doing something similar with a Vagrant box). Yet there seems to be a dearth of things like Ansible playbooks for setting up the base machine.

Maybe people think it's just too easy to be worth putting into Ansible. After all, it's mostly just installing software (which is simple enough to do with a quick install command to the package manager), and most people like me already have their own dotfiles repo, so what's the point?

They're not wrong, entirely, but that's a lot of software to remember to install each time, and it may be few and far enough times between re-installs that I, at least, am liable to forget what all I need, exactly. Plus, there's network mappings that could be set up, printers to install, etc. *This is the stuff tools like Ansible were made for.*

Okay, technically, the big names in open source provisioning (Ansible, Chef, Puppet, etc) may not market themselves as desktop provisioners, but the idea came about from the enterprise world, where tools like Microsoft's System Center Orchestrator and Altiris are huge for managing the desktop (and in some cases, server) environment. They are *literally* and *explicitly* built for this kind of thing, and even if the open source tools we're familiar with don't advertise themselves as such, they are quite capable of being leveraged in a similar manner.

# Why do this, and not just use a dotfiles repo?

First of all, *why not*?

Okay, a real reason? Why do this, especially since I already have a dotfiles repo? Because I'm lazy and often find myself having forgotten to install some application that I use, so I have to stop and install it. This way, I can maintain a list of stuff on my fresh computer, and add to the list if I add anything else I want installed by default.

I can also automate the setup of my network shares, printers, and dotfiles, and do so in a more human-readable way, and do it all automatically. Ideally, I could do it with two commands from a brand new system -- download the repo and run the bootstrapper (or, maybe one day, I set up a master system to just push the provisioning sequence to the target computer).

Also, I figured this would be as good a reason as any to toy around with writing an Ansible playbook.

This is what happens when I live with an SCCM administrator...

## But couldn't you do that in your existing dotfiles repo?

I admit, I actually tried that at first. As soon as I needed to deal with different operating systems, it became overly cumbersome, because there are just enough differences between a Mac and a Debian/Red Hat/Arch based system that it was becoming ridiculous (and heaven forbid packages get named the same across different package managers). Trying to detect and adapt to these differences was starting to go beyond what simple bash scripts could feasibly and reasonably do (they can do it, but it gets unwieldy pretty quickly).

# So, what's in this?

Right now, it's the basis of my system. Exactly what's above, pretty much.

vars/all.yml has the customizable stuff. Right now, that's the list of applications, home location, git author info, Github setup info (I...think this works...I don't remember), dotfile customization information, and Atom packages. More will probably come later.

inventories/ holds info on the target machines. Right now, it's just local ones. The playbook also auto-detects the platform (Linux, Windows, Mac), package manager (pacman, apt, etc), and distribution (Antergos, Ubuntu, etc) and creates dynamic groups based on this information, for future use on other platforms (I haven't built it all out yet).

library/ includes an addon to allow use of Yaourt on Arch systems. This module is slated to be added to one of the ansible-modules repos at some point, but I'm not sure when. It works right now, though. It also includes an addon for Atom. If you don't use Atom's starring feature to keep track of your packages (`atom stars --install`), the addon allows you to install packages from a static list (the role isn't set up, though).

roles/ is currently split into three sections -- common (system setup), github (github-specific stuff), and dotfiles (well...the dotfiles). More will follow when I have time and am on my network to set up network stuff.

# How about dependencies?

Right now, the bootstrap script is only the Ansible command, so you need to install Ansible (ideally, 2.1 or later, since there's something in the 2.x line that isn't in the 1.x line, making this playbook fail on 1.x).

You'll also need a way to get the repo. Either wget or git.

One of these days, I'll add in some logic to install Ansible, so the only manual thing is downloading the repo.
