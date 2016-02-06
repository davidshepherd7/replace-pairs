;;; replace-pairs.el --- Find-replace pairs of things -*- lexical-binding: t; -*-

;; Copyright (C) 2015 Free Software Foundation, Inc.

;; Author: David Shepherd <davidshepherd7@gmail.com>
;; Version: 0.1
;; Package-Requires: ((dash "2.10.0") (names "20150618.0") (emacs "24.4"))
;; Keywords:
;; URL: https://github.com/davidshepherd7/replace-pairs

;;; Commentary:

;; TODO: write something here

;;; Code:

;; TODO: single ecukes step to execute function

(require 'dash)
(require 'rx)


(defvar replace-pairs-pair-table (make-hash-table :test #'equal))

(defun replace-pairs-add-pair (open close)
  (puthash open close replace-pairs-pair-table)
  (puthash close open replace-pairs-pair-table))

(-each '(("(" . ")")
         ("[" . "]")
         ("{" . "}")
         ("<" . ">")
         )
  (-lambda ((open . close)) (replace-pairs-add-pair open close)))


(defun replace-pairs-opposite (opening)
  (or (gethash opening replace-pairs-pair-table)
      (error (concat "Opposite of " opening " not found"))))


(defun replace-pairs-choose-replacement (opening dummy)
  (cond ((match-string 1) opening)
        ((match-string 2) (replace-pairs-opposite opening))
        (t (error "No match found"))))


(defun replace-pairs (from-item to-item delimited start end backward)
  (interactive
   (let ((common
          (query-replace-read-args
           (concat "Query replace"
                   (if current-prefix-arg
                       (if (eq current-prefix-arg '-) " backward" " word")
                     "")
                   " regexp"
                   (if (and transient-mark-mode mark-active) " in region" ""))
           t)))
     (list (nth 0 common) (nth 1 common) (nth 2 common)
           ;; These are done separately here
           ;; so that command-history will record these expressions
           ;; rather than the values they had this time.
           (if (and transient-mark-mode mark-active)
               (region-beginning))
           (if (and transient-mark-mode mark-active)
               (region-end))
           (nth 3 common))))

  (let ((regexp (rx-to-string `(or (group ,from-item)
                                   (group ,(replace-pairs-opposite from-item)))))
        (replacement (cons #'replace-pairs-choose-replacement to-item)))
    (perform-replace regexp replacement t t delimited nil nil start end backward)))


(provide 'replace-pairs)

;;; replace-pairs.el ends here
