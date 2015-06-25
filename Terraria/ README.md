# make/restore player backups, quick items farm

### setup

you have to change variables to match your own:
**username** - your system username, you currently running on your PC
**playername** - your steam username, you playing game on

you have 2 directories and 2 files:

* GAME DIR

```
c:\Users\%username%\Documents\My Games\Terraria\
```

place **stash_player.bat** inside **GAME DIR**

* STASH DIR

```
c:\tmp\TERRARIA_STASH\
```

place **unstash_player.bat** inside **STASH DIR** (create it before or change to whatewer you like)

if you set your own custom locations, reflect changes in **DEST_DIR** and **SRC_DIR** vars in both .bat files

### how to

1. run game

2. make changes (slot things)

3. save and exit (to main menu)

4. make copy of your character (backup), running **stash_player.bat**

5. run game

6. make changes (unslot things, "deposit all" on chests)

7. save and exit (to main menu)

8. restore your character backup, running **unstash_player.bat**

9. repeat from step 5...

good works on dedicated home world for farming with room full of chests)
