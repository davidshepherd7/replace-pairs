;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.

(When "^I replace-pairs \"\\([^\"]+\\)\" -> \"\\([^\"]+\\)\" in buffer$"
      (lambda (from to)
        (Given "I go to point \"0\"")
        (Given "I start an action chain")
        (And "I press \"<menu>\"")
        (And "I type \"replace-pairs\"")
        (And "I press \"<return>\"")
        (And (concat "I type \"" from "\""))
        (And "I press \"<return>\"")
        (And (concat "I type \"" to "\""))
        (And "I press \"<return>\"")
        (And "I execute the action chain")))


(When "^I query-replace-pairs \"\\([^\"]+\\)\" -> \"\\([^\"]+\\)\" in buffer$"
      (lambda (from to)
        (Given "I go to point \"0\"")
        (Given "I start an action chain")
        (And "I press \"<menu>\"")
        (And "I type \"query-replace-pairs\"")
        (And "I press \"<return>\"")
        (And (concat "I type \"" from "\""))
        (And "I press \"<return>\"")
        (And (concat "I type \"" to "\""))
        (And "I press \"<return>\"")
        (And "I press \"!\"")
        (And "I execute the action chain")))

(When "^I add a new pair \"\\([^\"]+\\)\", \"\\([^\"]+\\)\"$"
      (lambda (open close)
        (replace-pairs-add-pair open close)))
