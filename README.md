All credits go to https://github.com/twilsonco/TransmissionBot

# Transmission Discord Bot
A self-hosted python [Discord.py](https://github.com/Rapptz/discord.py) bot for controlling an instance of [Transmission](https://transmissionbt.com), the bittorrent client,  from a **private** Discord server.
Using the [transmissionrpc](https://pythonhosted.org/transmissionrpc/) python library, this bot is built on [kkrypt0nn's bot template](https://github.com/kkrypt0nn/Python-Discord-Bot-Template) and adapted from [leighmacdonald's transmission scripts](https://github.com/leighmacdonald/transmission_scripts).

## Features overview
* [Interact via text channels or DMs](https://github.com/twilsonco/TransmissionBot#channelDM)
* [Add transfers](https://github.com/twilsonco/TransmissionBot#add)
* [Modify existing transfers](https://github.com/twilsonco/TransmissionBot#modify)
* [Check transfer status](https://github.com/twilsonco/TransmissionBot#status) (with optional realtime updating of output)
* [Notification system for transfer state changes](https://github.com/twilsonco/TransmissionBot#notifications)
* [Pretty output and highly configurable](https://github.com/twilsonco/TransmissionBot#pretty)
* [Easy setup](https://github.com/twilsonco/TransmissionBot#setup)
* [`t/help` for usage information](https://github.com/twilsonco/TransmissionBot#help)

## Configure
1. Setup your new bot on Discord:
	1. Sign up for a Discord [developer account](https://discord.com/developers/docs)
	2. Go to the [developer portal](https://discordapp.com/developers/applications), click *New Application*, pick a name and click *Create*
		* *Note the `CLIENT ID`*
	3. Click on *Bot* under *SETTINGS* and then click *Add Bot*
	4. Fill out information for the bot and **uncheck the `PUBLIC BOT` toggle**
		* *Note the bot `TOKEN`*
2. Invite the bot to your server
	1. Go to `https://discordapp.com/api/oauth2/authorize?client_id=<client_id>&scope=bot&permissions=<permissions>`
		* replace `<client_id>` with the `CLIENT ID` from above
		* replace `<permissions>` with the minimum permissions `93248`(*for read/send/manage messages, embed links, read message history, and add rections*) or administrator permissions `9` to keep things simple
	2. Invite the bot to your server
2. Configure [`config.json`](https://github.com/twilsonco/TransmissionBot#configfile) file starting with `config-sample.json`
	* *All values with* `ids` *are referring to Discord IDs, which are 18-digit numbers you can find by following [these instructions](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID-)*
	* Values that MUST be configured: `bot_token`, `listen_channel_ids` if you want to use in-channel, `notification_channel_id` if you wish to use in-channel notifications, `owner_user_ids` at least with your Discord user id, `tsclient` with information pointing to your Transmission remote gui, `whitelist_user_ids` at least with your Discord user id and any other Discord users you wish to be able to use the bot.


## Docker-compose example
```
version: '3.3'
services:
     transmissionbot:
        image: 'tdelorge/transmissionbotdiscord'
        container_name: transmissionbot
        volumes:
            - 'path/to/config.json:/TransmissionBot/config.json:rw'
        restart: unless-stopped
```