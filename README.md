# Golden Kali
I believe every Kali VM should be ephemeral. Build it, do your damage, then blow it away. While that's impractical to do it for every single engagement, and since Kali is *almost perfect*, there are still a bunch of things that I modify after a fresh Kali build. Since re-doing all of those tasks is tiresome, I decided to create a solid foundation of "good enough" to start off a fresh build of Kali and download all of the tools I find myself using all the time. So I made this script. It starts a bash script to install ansible via pipx, then uses ansible to download all the appropriate packages, clone the appropriate repositories, and make the appropriate modifications to the system to get it to a point close enough to how I like.

## Usage
If you just started up a new instance of **Kali**, to get it to a "proper working setup" that I've come to like, simply run the following command from a terminal:

```bash
git clone https://github.com/AgroDan/golden-kali.git && bash ./golden-kali/setup.sh
```

The previous command used to be a `curl` instruction piped to `bash`. I changed that to a `git clone` instead to change up the way files would be included. It was cleaner and I was able to mess around with ansible's conditional logic a bit more. Additional changes will now prompt you for your password to execute the ansible changes as root. This is necessary to install packages via apt. However now ansible will be installed for the current user rather than the root user. Note you are still allowing code to execute as the root user to install various tools that *I personally* find very useful. They may not be what you find useful, they may not be what you prefer. Please review the code above as it is all open source for your assurance. Know this: I may be installing malicious software, but I wish no mal-intent to you. Peace, love, and hack all the things.

## I Encourage Forking

I expect that my customizations will not necessarily work for everyone. Like I said, this is tailored to _my_ preferences. Feel free to fork the code, or just straight-up copy word for word and start your own. If you do, here's some notes about how to customize:

- This is mostly ansible scripts. Some working knowledge of tuning ansible is required here. It's not difficult [I assure you](https://docs.ansible.com/).
- I have split up work into three roles:
    - If you need to modify packages installed from the Package manager, modify `/roles/package-mgmt/tasks/main.yml`
    - If you need to modify one-off packages installed from `git`, `pipx`, `gem` or even how to compile them, modify `/roles/individual-apps/tasks/main.yml`. Note though, that kali among other distros have disabled installing system packages from pip without a virtual environment configured. It is best to install packages from their apt repo, typically as `python3-<package_name>`.
    - If you need to modify desktop-based configurations, modify `/roles/custom-config/tasks/main.yml`
- Even if you don't know ansible, you can probably guess what you need to change by using what I wrote as an example template.
- Contributions are always welcome! I know enough ansible to do neat things, but I'm by no means an expert. Feel free to tell me what I'm doing wrong and how I can go about making it even better!

## Changelog

- Latest change: Ansible roles!

I made some significant changes to this repository from the previous iteration. First, the name has been changed to `golden-kali`. Second, I have removed support for ParrotOS. It's generally something I don't use all that often to support it, so this is what you have. I'm sure you can apply all of the ideas here for a ParrotOS build as well if that's your thing.

Many of the changes here came as a result of this repository being included as a necessary install step process for the Red Team at [DoE's Cyberforce Competition](https://cyberforce.energy.gov/cyberforce-competition/) in 2022. The code was modified heavily for the event's exhaustive playbook. I took what I had learned there and simply applied it here.

## Caveat Emptor

Through exhaustive testing and re-testing, we have determined that this will install approximately 13 Gigabytes of data onto your Kali machine. It is advised that you have at least 15 Gigabytes free before running this installer!

Despite all of our efforts, no one has been able to get this script to work on Apple's M1 architecture. This is for AMD64 only. Sorry!

This script takes a _long_ time to complete. The longest step is patching and updating the machine before executing any of the plays. It is advised for your own sanity to ensure that your machine is patched to the latest before running this script.
