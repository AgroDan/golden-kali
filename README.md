# Golden Kali
I believe every Kali VM should be ephemeral. Build it, do your damage, then blow it away. While that's impractical to do it for every single engagement, and since Kali is *almost perfect*, there are still a bunch of things that I modify after a fresh Kali build. Since re-doing all of those tasks is tiresome, I decided to create a solid foundation of "good enough" to start off a fresh build of Kali and download all of the tools I find myself using all the time. So I made this script. It starts a bash script to install pip, then install ansible, then use ansible to download all the appropriate packages, clone the appropriate repositories, and make the appropriate modifications to the system to get it to a point close enough to how I like.

And if you don't like my modifications, I encourage you to fork this repo and make your own changes.

## Usage
If you just started up a new instance of **Kali**, to get it to a "proper working setup" that I've come to like, simply run the following command from a terminal:

`git clone https://github.com/AgroDan/golden-kali.git && sudo bash ./golden-kali/setup.sh`

The previous command used to be a `curl` instruction piped to `bash`. I changed that to a `git clone` instead to change up the way files would be included. It was cleaner and I was able to mess around with. I may be installing malicious software, but I wish no mal-intent to you. Peace, love, and hack all the things.

## Changelog

I made some significant changes to this repository from the previous iteration. First, the name has been changed to `golden-kali`. Second, I have removed support for ParrotOS. It's generally something I don't use all that often to support it, so this is what you have. I'm sure you can apply all of the ideas here for a ParrotOS build as well if that's your thing.

Many of the changes here came as a result of this repository being included as a necessary install step process for the Red Team at (https://cyberforce.energy.gov/cyberforce-competition/)[DoE's Cyberforce Competition] in 2022. The code was modified heavily for the event's exhaustive playbook. I took what I had learned there and simply applied it here.