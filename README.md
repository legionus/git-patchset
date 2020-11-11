# git-patchset

This is highlevel utility for easy patchset creation. Each patchset has a version
and description.

```
Usage: git patchset [<command>] [<args>]
   or: git patchset create <newname> [<start-point>]
   or: git patchset new [<patchset>] [number]
   or: git patchset list [--all|--latest] [--archive]
   or: git patchset info [-e|--edit] [--no-pager] [<patchset>]
   or: git patchset export [--resend] [--rfc] [<patchset>] [<options>]
   or: git patchset send [[<options>] <files|directory>]
   or: git patchset archive [--add|--restore] [<patchset>]
   or: git patchset help [<command>]

This is highlevel utility for easy patchset creation. Each patchset has
a version and description.

Commands:

create    Creates branch for a new patchset. The new branch will be
          created with v1 version. The new branch head will point to
          <start-point> commit or to current commit.

new       Creates branch for a new version of <patchset>. Branch will
          copy the description and recipient list.

list      Shows a list of known patchsets. The current patchset will
          be marked with an asterisk. The list also shows the base and
          last commits as well as the number of commits.

info      Shows or changes the description of the patchset. This description
          will be used for cover-letter.

export    Prepares patches for e-mail submission. The <options> will be passed
          to git-format-patch(1).

send      Sends patches by e-mail. The <options> will be passed
          to git-send-email(1). Without any options, the command
          will export current patchset itself.

archive   Archive or unarchive the patchset. The specified version will be
          ignored. The archived patchset is not listed by default.

help      Shows this message and exit.

Report bugs to authors.

```

