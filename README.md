LispEA
======

Linux Integration Patterns for Enterprise Applications / Lisp Enterprise Architecture

## Project Workflow and History Policy

While commit rebasing and history revision place enormous power
at Git's disposal, they can also precipitate great
[peril](http://git-scm.com/book/en/Git-Branching-Rebasing#The-Perils-of-Rebasing);
Linus Torvalds, of course, has elaborated own [stern
warnings](http://lwn.net/Articles/328438/) about rewriting published
histories.

In the interest of data redundancy, however, we've elected a
pragmatic policy that allows revision of "volatile" branch histories,
while preserving the history of "stable" branches. Note that
"volatile" and "stable" refer to commit history, rather than
code/version/API compatability (alhough the two will often
coincide). Here is the rubric, in decreasing order of canonicity, and
with ineffable gratitude to [Vincent
Driessen](http://flattr.com/profile/nvie)'s eloquent essay
"[A Successful Git Branching
Model](http://nvie.com/posts/a-successful-git-branching-model/):

- stable branches:
    - `master`: always points to the most stable version of the code,
      which anyone should be able to checkout and build without
      hassle (while forgoing late-breaking candy from the
      bleeding-edge).
    - `fix`: hotfixes needed to correct severe defects in `master`.
    - `rel`: release branches geared towards a
      [clean-cut](http://semver.org/) release tag against `master`
    - `bug`: topic branches focused on resolving a specific defect
      (to be resolved with a future release); note that while
      bug-fixes can be back-ported to a release branch for the benefit
      of consumers constrained to that release (e.g. because
      successive releases break compatibility), the release tag
      against `master` will not be re-cut to the back-port (unlike
      urgent hot-`fix` branches).
    - `dev`: development branches geared towards growing new features
      and functionality; these may be turbulent, yet not
      volatile. Note also that in lieu of `feature` branches, instead
      we have sub-branches (e.g. `dev-spec`: "Specification
      Development" or `dev-util`: "Utility Features").
- volatile branches:
    - `sandbox`: a namespace that facilitates frequent commits, while
      allowing the freedom to restructure history before rebasing onto a
      (history-)stable branch. We make no guarantees that the history
      in sandbox branches won't be rewritten, hidden, destroyed,
      clobbered, or outright denied to have ever existed ("these
      aren't the commits you're looking for …"). Individual committers
      might make their own promises about a sandbox named for them
      (e.g. `sandbox-reuben`) — but you're on your own if you choose
      to trust them! The idea here is to create a space where it's
      okay to get a little messy, as well as to afford a
      clearing-house for developers to trade commits off a central
      remote repository. A key side-effect, however, is that sandbox
      commits must be
      [rebased](http://git-scm.com/book/en/Git-Branching-Rebasing#The-Basic-Rebase)
      onto a (downstream) `dev` branch and then
      [fast-forwarded](http://git-scm.com/docs/git-merge#_fast-forward_merge)
      to the tip of the sandbox, because we'd rather not deal with a
      dangling merge from an absent ancestor once the sandbox is
      garbage-collected.
