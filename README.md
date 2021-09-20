# Translation scripts

These are scripts that I use in order to speed up my workflow when translating for the GNOME project at [Damned Lies](l10n.gnome.org).

Are you new to translating the GNOME Project? See below for a small introduction on how to get started!

Please be aware that this is still in the making and not 100% foolproof. But as long as you don't throw too weird stuff to these scripts, you should be fine ;)

Contributions, be it bug reports or PRs, are very welcome! Please have a look at CONTRIBUTING.md if you want to help out.

## What you need

For `translate.sh`:

- `poedit`
- `meld`
- `libnotify` (for `notify-send`)
- `grep`

For `proofread.sh`:

- `poedit`
- `meld`

In the future, I plan to turn the program calls into environment variables,
so that you can use your preferred translation programs without editing the script that much.
If you have an even better idea, I'd love to hear it!

## How it works

There are two scripts in this repo, fitting the lifecycle of a translation in the GNOME project. Here's what they do:

### translate.sh

In order to translate a module, do as follows:

1. Download the `po` file from l10n.gnome.org
2. Run `translate.sh path/to/file.po`
3. `poedit` opens - Get translation work done!
The script also checks if it can find `translator-credits` - if yes, it reminds you to check whether you are already in there or not.
4. When you are done translating, `meld` opens and you can review the changes you have made.
It also checks whether your name is in the header of the `po` file.
I am not sure how common this is around other translation teams, but it is standard in the German team to put your name in there,
to give you credit and to be able to re-trace in case of errors or questions.
Feedback on this is greatly appreciated!

### proofread.sh

In order to proofread an existing translation, do as follows:

1. Download the `po` file that introduced the changes you want to proofread, and the one before it.
Use the links with "**merged**" in the filename, this ensures that any changes in the souce code are incorporated.
2. Run `proofread.sh old.po new.po`
3. `meld` opens: The old file is on the left, and a copy of the new file on the right.
Make necessary changes to said copy (called `checked.po`, because you will have proofread it).
Mark translations as `fuzzy` if you want to have a look at them in the next step.
4. Now, `poedit` opens in order to allow you more complex edits and to look at the translation database.
You can also translate any untranslated strings, if you want.
5. As last step, the original file that needed proofreading and your final version are compared in `meld`.
This lets you check your edits one last time and helps with writing a message about the changes to the original translator.

Once all this is done, you just need to upload the file `FINAL-*.po` to Damned Lies and you are good to go!

## New to translating the GNOME Project?

First of all - Welcome! I am very happy that you want to contribute by translating apps for the GNOME ecosystem.

A good place to get started is "Damned Lies", the web application we use to coordinate translation within the different language teams.
Go to <https://l10n.gnome.org/teams/> and search for your language.

For instructions on how to join a team, have a look at team page for your language or contact the team coordinator.

Some good places to stay up to date and ask questions are as follows:

- The GNOME i18n [IRC/Matrix](https://wiki.gnome.org/GettingInTouch/IRC)
- The GNOME i18n [mailing list](https://mail.gnome.org/mailman/listinfo/gnome-i18n)
- The mailing list of the translation team for your language

If you have questions regarding the scripts in this repo, don't hesitate to ask! I'll do my best to answer them.
