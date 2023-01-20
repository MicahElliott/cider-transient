;;; cider-transient.el --- Most useful/common cider commands into transient menu -*- lexical-binding: t -*-

;; Copyright (C) 2023 Micah Elliott

;; Author: Micah Elliott <mde@micahelliott.com
;; URL: https://github.com/MicahElliott/symbolic-clojure
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3"))
;; Keywords: symbols, clojure

;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Collect the most useful/common cider (and clojure) commands into a
;; transient menu.
;;
;; There are very many cider and clojure commands from `C-c ...' and then a
;; series of more keypresses. This aims to collect all the most important ones
;; into a single menu. It helps with memory, discoverability, and speed.
;;
;;; Code:

(require 'transient)

;; These are laid out to produce a very wide view, intended for
;; wide/full-screen monitor
(transient-define-prefix cider-transient ()
  "Transient for Cider."
  [;; Newline intentional for menu spacing
   "Cider and Clojure Commands
"
   ["Browse/Docs"
    ("bb" "Browse" cider-browse-ns)
    ("ba" "Browse All" cider-browse-ns-all)
    ;; ("bm" "Browse Mode Menu" cider-browse-ns-mode-menu)
    ;; ("b2" "Browse" cider-browse-ns-buffer)
    ;; ("x" "Browse" cider-browse-ns-current-ns)
    ("bf" "Browse FAP" cider-browse-ns-find-at-point)
    ("bd" "Browse DAP" cider-browse-ns-doc-at-point)
    ("bd" "Doc" cider-doc)
    ("bj" "Javadoc" cider-javadoc)
    ("bc" "Clojuredocs" cider-clojuredocs)
    ("bw" "Clojuredocs web" cider-clojuredocs-web)
    ;; ("dS" "Docview dv source" cider-docview-source)
    ;; ("dJ" "Docview dv java" cider-docview-javadoc)
    ;; ("dC" "Docview dv clj" cider-docview-clojuredocs)
    ;; ("dW" "Docview dv web" cider-docview-clojuredocs-web)
    ]

   ["Eval"
    ("vb" "Buffer" cider-eval-buffer)
    ("vs" "SAP" cider-eval-sexp-at-point)
    ("vr" "Region" cider-eval-region)
    ("vl" "Last sexp" cider-eval-last-sexp)
    ("vp" "Print last" cider-eval-print-last-sexp)
    ("vR" "Replace sexp" cider-eval-last-sexp-and-replace)
    ("vc" "Pprint" cider-pprint-eval-last-sexp-to-comment)]
   ["Insert into REPL"
    ("in" "Insert NS" cider-insert-ns-form-in-repl)
    ("id" "Insert defun" cider-insert-defun-in-repl)
    ("ir" "Insert region" cider-insert-region-in-repl)
    ("is" "Insert last sexp" cider-insert-last-sexp-in-repl)]
   ["Namespace"
    ("nn" "Set in REPL" cider-repl-set-ns)
    ("nf" "Find" cider-find-ns)
    ("nl" "Reload" cider-ns-reload)
    ("nL" "Reload All" cider-ns-reload-all)
    ("nr" "Refresh" cider-ns-refresh)
    ("nv" "Eval Form" cider-eval-ns-form)
    ("na" "Load All" cider-load-all-project-ns)
    ("nr" "Insert Form REPL" cider-insert-ns-form-in-repl)]
   ["Refactor Cycle/Convert"
    ;; Cycle/toggle
    ("rci" "If" clojure-cycle-if)
    ("rcn" "Not" clojure-cycle-not)
    ("rcw" "When" clojure-cycle-when)
    ("rcp" "Privacy" clojure-cycle-privacy)
    ("rci" "Ignore form" clojure-toggle-ignore)
    ("rcd" "Ignore fn" clojure-toggle-ignore-defun)
    ("rcf" "Ignore surround" clojure-toggle-ignore-surrounding-form)
    ;; Convert
    ("rcm" "To map" clojure-convert-collection-to-map)
    ("rcs" "To set" clojure-convert-collection-to-set)
    ("rcl" "To list" clojure-convert-collection-to-list)
    ("rcv" "To vector" clojure-convert-collection-to-vector)
    ("rcq" "To quoted list" clojure-convert-collection-to-quoted-list)]

   ;; NOTE: these require 3 strokes
   ["Refactor misc"
    ("rpp" "Promote fn lit" clojure-promote-fn-literal)
    ("raa" "Add arity" clojure-add-arity)
    ("rtt" "Thread" clojure-thread)
    ("rtf" "Thread first" clojure-thread-first-all)
    ("rtl" "Thread last" clojure-thread-last-all)
    ("rnn" "Insert ns" clojure-insert-ns-form)
    ("rNN" "Insert ns ap" clojure-insert-ns-form-at-point)
    ("rns" "Sort ns" clojure-sort-ns)
    ("rrn" "Rename alias" clojure-rename-ns-alias)
    ("rnu" "Update ns" clojure-update-ns)
    ("rll" "Intro let" clojure-introduce-let)
    ("rlm" "Move to let" clojure-move-to-let)
    ("rlf" "Let fwd slurp" clojure-let-forward-slurp-sexp)
    ("rlb" "Let bkw slurp" clojure-let-backward-slurp-sexp)
    ("ruu" "Unwind" clojure-unwind)
    ("rUU" "Unwind all" clojure-unwind-all)]
   ["Start"
    ("cj" "Jack-in CLJ" cider-jack-in-clj)
    ("cJ" "Jack-in CLJS" cider-jack-in-cljs)
    ("cb" "Jack-in CLJS" cider-jack-in-cljs)
    ("ca" "Connect" cider-connect)
    ("cc" "Connect CLJ" cider-connect-clj)
    ("cC" "Connect CLJS" cider-connect-cljs)
    ("cs" "Connect sib CLJ" cider-connect-sibling-clj)
    ("cS" "Connect sib CLJS" cider-connect-sibling-cljs)
    ("cd" "Describe Conn" cider-describe-connection)
    ("cD" "Describe nrepl" cider-describe-nrepl-session)
    ]
   ["Test"
    ("tr" "Run single" cider-test-run-test)
    ("ta" "Run all ns" cider-test-run-ns-tests)
    ("tR" "Rerun single" cider-test-rerun-test)
    ("tf" "Rerun failed" cider-test-rerun-failed-tests)
    ("tl" "Run loaded" cider-test-run-loaded-tests)
    ("tp" "Run proj" cider-test-run-project-tests)
    ("tn" "Next result" cider-test-next-result)
    ("tp" "Pred result" cider-test-previous-result)
    ("tP" "Show Report" cider-test-show-report)
    ("tS" "Stacktrace" cider-test-stacktrace)
    ("td" "Ediff" cider-test-ediff)
    ("tc" "Clear hilights" cider-test-clear-highlights)
    ("tm" "Report menu" cider-test-report-mode-menu)
    ("tA" "Auto mode" cider-auto-test-mode)]
   ["XRef/Profile"
    ("xd" "Deps" cider-xref-fn-deps)
    ("xr" "Refs" cider-xref-fn-refs)
    ("xD" "Deps Select" cider-xref-fn-deps-select)
    ("xR" "Refs Select" cider-xref-fn-refs-select)
    ("xp" "Samples" cider-profile-samples)
    ("xa" "Summary" cider-profile-summary)
    ("xt" "Toggle Trace" cider-toggle-trace-ns)
    ("xp" "Toggle Profile" cider-profile-ns-toggle)
    ]
   ])

(provide 'cider-transient)
;;; cider-transient.el ends here
