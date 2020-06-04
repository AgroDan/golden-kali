# Fresh Install
I believe every Kali VM should be ephemeral. Build it, do your damage, then blow it away. While that's impractical to do it for every single engagement, and since Kali is *almost perfect*, there are still a bunch of things that I modify after a fresh Kali build. Since re-doing all of those tasks is tiresome, I decided to create a solid foundation of "good enough" to start off a fresh build of Kali and download all of the tools I find myself using all the time. So I made this script. It starts a bash script to install pip, then install ansible, then use ansible to download all the appropriate packages, clone the appropriate repositories, and make the appropriate modifications to the system to get it to a point close enough to how I like.

And if you don't like my modifications, I encourage you to fork this repo and make your own changes.

## Usage
If you just started up a new instance of **Kali**, to get it to a "proper working setup" that I've come to like, simply run the following command from a terminal:

`curl -sL https://raw.github.com/AgroDan/FreshInstall/master/setup-kali.sh | sudo bash`

I also dabble a bit in **Parrot OS**. I've since created a similar bootstrap for it as well:

`curl -sL https://raw.github.com/AgroDan/FreshInstall/master/setup-parrot.sh | sudo bash`

I know the flippant instruction of "copy this curl | bash command as root" is scary, but this is after all github, so feel free to look through the provided code to know that I'm not installing some crazy backdoor or anything. I may be installing malicious software, but I wish no mal-intent to you. Peace, love, and hack all the things.
