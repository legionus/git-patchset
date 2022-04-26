# git-patchset

This is highlevel utility for easy creating and maintaining a patchset. Patchset
is a set of patches that implement a feature or fix something.

Quite a common story when upstream asks for changes to a proposed patch (make a
new version). Sometimes there can be a dozen of such versions. When the prepared
changes in the one patch, then there are no special problems with preparing a
new version of this patch. When a patchset consists of 5, 8, or more patches,
updating it becomes a difficult rebase task.

This utility is designed to simplify the process of creating, updating and
publishing large patchsets. The utility relies heavily on techniques already in
git.

## Patchset

In git terms, patchset name is just a part of branch name. Each patchset has a
version and description. Each version of a patchset is represented by a git
branch.

To start a new patchset, you need to select a base branch:
```console
$ git branch --list 'linux-*'
  linux-5.10-rc6
  linux-5.10-rc7
  linux-5.6
  linux-5.7
  linux-5.8
  linux-5.9

$ git patchset create foo linux-5.10-rc7
Updating files: 100% (11538/11538), done.
Branch 'patchset/foo/v1' set up to track local branch 'linux-5.10-rc7'.
Switched to a new branch 'patchset/foo/v1.0'
git-patchset: new patchset created: patchset/foo/v1.0

$ git patchset list
* 0477e9288185..0477e9288185     (0) patchset/foo/v1.0
```

The new patchset starts at v1.0. When you create a new patchset, you will be asked
to describe the proposed changes.

To change the patchset description:
```console
$ git patchset cover -e
```

By default, the patchset list contains only the latest versions.
```console
$ git patchset
* 0477e9288185..0477e9288185    (11) patchset/foo/v1.0
- 0477e9288185..1e796f9e008f     (6) patchset/fuse-inprocess-request/v3.0
- e71ba9452f0b..5da51b21077b     (8) patchset/per-userspace-rlimit/v3.0
- 629727c85a17..2ef0e59e5c51     (5) patchset/proc-revealing/v4.0

$ git patchset list --versions
- bcf876870b95..d755e9e48cea    (11) patchset/foo/v1.0
- bcf876870b95..f2fb7c729413    (11) patchset/foo/v2.0
- 0477e9288185..cf5d6cd40d2e    (15) patchset/foo/v3.0
- e71ba9452f0b..54b0cf752c2c    (15) patchset/foo/v4.0
- e71ba9452f0b..5da51b21077b    (18) patchset/foo/v5.0
```

To prepare a patchset for publication use the command:
```console
$ git patchset export -o patches/
```

You can use any method for submitting patches. If you use git-send-email, you
can do it right away:

```console
$ git patchset send
```

## License

SPDX-License-Identifier: GPL-2.0

## Bugs

Report bugs to authors.
