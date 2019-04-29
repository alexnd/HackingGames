# Terraria hacking

![Terraria](./Guide.png)

![TChock](https://tshock.co/newlogo.png)

![Docker](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/320px-Docker_%28container_engine%29_logo.svg.png)

## How to run your dedicated Terraria linux-based server, based on TShock

[What is Terraria?](https://terraria.org) - Single/multi-player game, coop digging 2d world-sandbox. Unique fantasy setting.

[Terraria Wiki](https://terraria.gamepedia.com/Terraria_Wiki) - Details about this large ecosystem, biomes types, recipes...

[What is TShock?](https://github.com/Pryaxis/TShock/releases) - Terraria server modification, provides full access to farming items, spawn mobs, summon bosses, etc...

[Guide for TShock in Steam](https://steamcommunity.com/sharedfiles/filedetails/?id=1286502182)

First of all, you need to get docker ecosystem running on your linux box, it can be done running:

```
sudo apt install curl docker-ce
```

[How to install docker on Ubuntu Linux?](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

Anyway, the same scenario matches OSX

Don't test it yet on mac, good issue. We run 64-x linux-based Ubuntu in virtualbox on host computer, so in this case it becomes 100% working, not depends at what OS you running on

Scenario to run docker container running on port 7777 with console attached:

```
cd
mkdir Terraria
cd Terraria
mkdir Worlds
(cp all backed up worlds to it...)
cd ~/Terraria
curl -LJO https://raw.githubusercontent.com/alexnd/HackingGames/master/Terraria/Dockerfile
docker build -t "tshock-server" .
docker run -it -p 7777:7777 -v $HOME/Terraria/Worlds:/world --name="terraria" tshock-server
```

Running console shows the next output:

```
...
Settling liquids 99%
Starting server...

Terraria Server v1.3.5.3

Listening on port 7777
Type 'help' for a list of commands.

TShock Notice: To become SuperAdmin, join the game and type /auth 4633541
This token will display until disabled by verification. (/auth)
: Server started
```

You can run commands interactively. To gracefully shutdown type `exit` and press ENTER

```
exit
Server executed: /exit.
Saving world. Momentary lag might result from this.
Saving world data: 1%
...
Validating world save: 82%
World saved.
Backing up world file
Server shutting down!
```

Than you can run server with config file or path to world, add the next param to docker command:

```
-world /world/<your_world_file>.wld
```

To run stopped container, sometime in the future:

```
docker start -a -i `docker ps -q -l`
```

Inspired by [Ryansheehan's work](https://github.com/ryansheehan/terraria)

To dig into admin cli, follow official [Tshock docs](https://tshock.readme.io/docs/basic-user-management)

For 2019 we require web cli (PWA) nodejs-based community driven app to be developed...

...Than you just run second container with web-gui and open next level in your community farming experience!

Next ideas:
- Extend package scripts, make as ready-to-use tool with tested npm commands
- Web-gui: Control backend server app. Items ids database with datamining from official wiki sources

# "Old way" tools ;)

## Make/restore player backups, quick items farm

### Setup

You have to change variables to match your own:

`username` - your system username, you currently running on your PC

`playername` - your steam username, you playing game on

You have 2 directories and 2 files:

* GAME DIR

```
c:\Users\%username%\Documents\My Games\Terraria\
```

Place `stash_player.bat` inside `GAME DIR`

* STASH DIR

```
c:\tmp\TERRARIA_STASH\
```

Place `unstash_player.bat` inside `STASH DIR` (create it before or change to whatewer you like)

If you set your own custom locations, reflect changes in `DEST_DIR` and `SRC_DIR` vars in both `.bat` files

### Real farming scenario

1. Run game

2. Make changes (slot things)

3. Save and exit (to main menu)

4. Make copy of your character (backup), running `stash_player`

5. Run game

6. Make changes (unslot things, "deposit all" on chests)

7. Save and exit (to main menu)

8. Restore your character backup, running `unstash_player`

9. Whan you need to roll back the world, repeat from step 5...

Good for working in a dedicated home world for farming with room full of chests ;)

# Pro ;) Tips

* https://terraria.gamepedia.com/Guide:Setting_up_a_Terraria_server

* https://forums.terraria.org/index.php?threads/someone-know-where-i-can-found-world-and-player-saves-on-ubuntu-16-04-lts.47797/

```
    #!/bin/sh
    ./TerrariaServer -config <serverconfigfile>
```
