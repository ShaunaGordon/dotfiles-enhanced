# WHY HAS NO ONE DONE THIS?!

Seriously, it seems so simple. I put pretty much the same software and have the same settings across most of my computers. I already use provisioners my servers (hell, a good portion of people do it with their servers nowadays, at the very least, they're doing something similar with a Vagrant box). Yet there seems to be a derth of things like Ansible playbooks for setting up the base machine.

Maybe people think it's just too easy to be worth putting into Ansible. After all, it's mostly just installing software (which is simple enough to do with a quick install command to the package manager), and most people like me already have their own dotfiles repo, so what's the point?

They're not wrong, entirely, but that's a lot of software to remember to install each time, and it may be few and far enough times between re-installs that I, at least, am liable to forget what all I need, exactly. Plus, there's network mappings that could be set up, printers to install, etc. *This is the stuff tools like Ansible were made for.*

Okay, technically, the big names in open source provisioning (Ansible, Chef, Puppet, etc) may not market themselves as desktop provisioners, but the idea came about from the enterprise world, where tools like Microsoft's System Center Orchestrator and Altiris are huge for managing the desktop (and in some cases, server) environment. They are literally and explicitly built for this kind of thing, and even if the open source tools we're familiar with don't advertise themselves as such, they are quite capable of being leveraged in a similar manner.

# Why do this, and not just use a dotfiles repo?

First of all, *why not*?

Okay, a real reason? Why do this, especially since I already have a dotfiles repo? Because I'm lazy and often find myself having forgotten to install some application that I use, so I have to stop and install it. This way, I can maintain a list of stuff on my fresh computer, and add to the list if I add anything else I want installed by default.

I can also automate the setup of my network shares, printers, and dotfiles, and do so in a more human-readable way, and do it all automatically. Ideally, I could do it with two commands from a brand new system -- download the repo and run the bootstrapper (or, maybe one day, I set up a master system to just push the provisioning sequence to the target computer).

Also, I figured this would be as good a reason as any to toy around with writing an Ansible playbook.

This is what happens when I live with an SCCM administrator...

# So, what's in this?

Right now, it's the basis of my system. Exactly what's above, pretty much.

vars/all.yml has the customizable stuff. Right now, that's the list of applications. More will probably come later.

inventories/ holds info on the target machines. Right now, it's just local ones, where I've set up some groups on the off-chance platform-specific stuff is needed. I'm pretty exclusively on Arch right now, though it's possible I'll have another platform to deal with eventually. Until that day, though, don't expect any platform-specific stuff, unless you're running Arch. If you're provisioning a remote computer, just add a "remote" entry into the inventory that mirrors the "local" one.