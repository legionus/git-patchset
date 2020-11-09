# git-patchset

This is highlevel utility for easy patchset creation. Each patchset has a version
and description.

```
Usage: git patchset [<command>] [<args>]
   or: git patchset create <newname> [<start-point>]
   or: git patchset new [<patchset>] [number]
   or: git patchset list [--all|--latest]
   or: git patchset info [-e|--edit] [--no-pager] [<patchset>]
   or: git patchset export [--resend] [--rfc] [<patchset>] [<options>]
   or: git patchset send [<options>] <files|directory>
   or: git patchset help
```

