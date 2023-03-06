# Cider Transient

Collect the most useful/common cider (and clojure) commands into a
transient menu.

![Example of cider-transient](./screenshot.png "xxx")

*Deps*: none! Transient is part of Emacs now

There are very many [CIDER](https://github.com/clojure-emacs/cider) and
clojure commands from `C-c ...` and then a series of more keypresses. Those
are hard to remember and may have conflicts with other bindings. This project
instead aims to collect all the most important ones into a single menu. It
helps with memory, discoverability, and speed.

## My Usage

The quick shortcut (key-chord binding) I use is `xc`. This enables, eg, `xctt`
to do a single _test run_. Note that he `xc` is just a single press really,
since it's an order-independent key-chord. Compare this to CIDER's default
binding: `C-c C-t C-t`. OK, for this case CIDER's is actually about the same
speed-wise, but for a lot of cases, cider-transient is pretty nice to have.
Out of habit, I actually still use CIDER's bindings sometimes, but I find that
there are too many of them buried too deep, with some odd mnemonics, and some
clash with some others that I like to define, so I'm considering removing all
of the CIDER defaults.

    ;; Safe and slow
    (key-chord-define-global "CC" 'cider-transient)
    ;; OR faster, look out for "xc" in exceed
    (key-chord-define-global "xc" 'cider-transient)
