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
   ["Connect"
    ("cj" "Jack-in clj" cider-jack-in-clj)
    ("cJ" "Jack-in cljs" cider-jack-in-cljs)
    ("cb" "Jack-in clj/s" cider-jack-in-clj&cljs)
    ("cd" "connect Default" cider-connect)
    ("cc" "Connect clj" cider-connect-clj)
    ("cC" "connect Cljs" cider-connect-cljs)
    ("cs" "connect Sib clj" cider-connect-sibling-clj)
    ("cS" "connect Sib cljs" cider-connect-sibling-cljs)
    ("cd" "Describe conn" cider-describe-connection)
    ("cD" "Describe nrepl" cider-describe-nrepl-session)]
   ["Eval"
    ("eb" "Buffer" cider-eval-buffer)
    ("ee" "Eval" cider-read-and-eval)
    ("ef" "Fap" cider-read-and-eval-defun-at-point)
    ("es" "Sap" cider-eval-sexp-at-point)
    ("er" "Region" cider-eval-region)
    ("el" "Last sexp" cider-eval-last-sexp)
    ("ep" "Print last" cider-eval-print-last-sexp)
    ("eP" "Pprint" cider-pprint-eval-last-sexp-to-comment)
    ("eR" "Replace sexp" cider-eval-last-sexp-and-replace)]
   ["Insert into REPL"
    ("in" "insert NS" cider-insert-ns-form-in-repl)
    ("id" "insert Defun" cider-insert-defun-in-repl)
    ("ir" "insert Region" cider-insert-region-in-repl)
    ("is" "insert last Sexp" cider-insert-last-sexp-in-repl)]
   ["Namespace"
    ("nn" "set Ns in repl" cider-repl-set-ns)
    ("nf" "Find" cider-find-ns)
    ("nl" "reLoad" cider-ns-reload)
    ("nL" "reLoad All" cider-ns-reload-all)
    ("nr" "Refresh" cider-ns-refresh)
    ("ne" "Eval form" cider-eval-ns-form)
    ("na" "load All" cider-load-all-project-ns)
    ("nr" "insert form in REPL" cider-insert-ns-form-in-repl)]
   ["Refactor Cycle/Convert"
    ;; Cycle/toggle
    ("rci" "If" clojure-cycle-if)
    ("rcn" "Not" clojure-cycle-not)
    ("rcw" "When" clojure-cycle-when)
    ("rcp" "Privacy" clojure-cycle-privacy)
    ("rci" "Ignore form" clojure-toggle-ignore)
    ("rcd" "ignore Defn" clojure-toggle-ignore-defun)
    ("rcf" "ignore surround" clojure-toggle-ignore-surrounding-form)
    ;; Convert
    ("rcm" "to Map" clojure-convert-collection-to-map)
    ("rcs" "to Set" clojure-convert-collection-to-set)
    ("rcl" "to List" clojure-convert-collection-to-list)
    ("rcv" "to Vector" clojure-convert-collection-to-vector)
    ("rcq" "to Quoted" clojure-convert-collection-to-quoted-list)]

   ;; NOTE: these require 3 strokes
   ["Refactor misc"
    ("rpp" "Promote fn lit" clojure-promote-fn-literal)
    ("raa" "add Arity" clojure-add-arity)
    ("rtt" "Thread" clojure-thread)
    ("rtf" "thread First" clojure-thread-first-all)
    ("rtl" "thread Last" clojure-thread-last-all)
    ("rnn" "insert Ns" clojure-insert-ns-form)
    ("rNN" "insert Ns ap" clojure-insert-ns-form-at-point)
    ("rns" "Sort ns" clojure-sort-ns)
    ("rrn" "reName alias" clojure-rename-ns-alias)
    ("rnu" "Update ns" clojure-update-ns)
    ("rll" "intro Let" clojure-introduce-let)
    ("rlm" "Move to let" clojure-move-to-let)
    ("rlf" "let Fwd slurp" clojure-let-forward-slurp-sexp)
    ("rlb" "let Bwd slurp" clojure-let-backward-slurp-sexp)
    ("ruu" "Unwind" clojure-unwind)
    ("rUU" "Unwind all" clojure-unwind-all)]
   ["Test"
    ("tn" "Ns run-all" cider-test-run-ns-tests)
    ("tt" "Test one" cider-test-run-test)
    ("ta" "Again-run one" cider-test-rerun-test)
    ("tf" "Failed rerun" cider-test-rerun-failed-tests)
    ("tl" "Loaded run" cider-test-run-loaded-tests)
    ("td" "eDiff" cider-test-ediff)
    ("tN" "Next result" cider-test-next-result)
    ("tP" "Prev result" cider-test-previous-result)
    ("tP" "run Proj" cider-test-run-project-tests)
    ("tR" "show Report" cider-test-show-report)
    ("tS" "Stacktrace" cider-test-stacktrace)
    ("tC" "Clear hilights" cider-test-clear-highlights)
    ("tM" "report Menu" cider-test-report-mode-menu)
    ("tA" "Auto mode" cider-auto-test-mode)]
   ["XRef/Profile"
    ("xd" "Deps" cider-xref-fn-deps)
    ("xr" "Refs" cider-xref-fn-refs)
    ("xD" "Deps select" cider-xref-fn-deps-select)
    ("xR" "Refs select" cider-xref-fn-refs-select)
    ("xp" "samPles" cider-profile-samples)
    ("xa" "summarize All" cider-profile-summary)
    ("xt" "toggle Trace" cider-toggle-trace-ns)
    ("xp" "toggle Profile" cider-profile-ns-toggle)
    ]])

(provide 'cider-transient)
;;; cider-transient.el ends here
