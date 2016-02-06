;;; replace-pairs.el --- Find-replace pairs of things -*- lexical-binding: t; -*-

;; Copyright (C) 2015 Free Software Foundation, Inc.

;; Author: David Shepherd <davidshepherd7@gmail.com>
;; Version: 0.1
;; Package-Requires: ((emacs "24.4"))
;; Keywords:
;; URL: https://github.com/davidshepherd7/replace-pairs

;;; Commentary:

;; TODO: write something here

;;; Code:

;; TODO: handle closing pair, full pair as input

(require 'rx)


;; Data structures

(defvar replace-pairs--closings-table (make-hash-table :test #'equal)
  "Private hash table, only modify via `replace-pairs-add-pair'

Contains mappings from an item of a pair to it's opposite.
")

(defvar replace-pairs--openings-table (make-hash-table :test #'equal)
  "Private hash table, only modify via `replace-pairs-add-pair'

Contains mappings from pair items to the oppening part of the
pair, e.g. ( -> (, ) -> (, () -> (.
")

(defun replace-pairs-add-pair (open close)
  "Add a new pair to be recognised by replace-pairs"
  (dolist (x (list open close (concat open close)))
    (puthash x close replace-pairs--closings-table)
    (puthash x open replace-pairs--openings-table)))

;; Add default pairs
(dolist (x '(("(" . ")")
             ("[" . "]")
             ("{" . "}")
             ("<" . ">")
             ))
  (replace-pairs-add-pair (car x) (cdr x)))


(defun replace-pairs--closing (item)
  (or (gethash item replace-pairs--closings-table)
      (error "Closing of %s not found" item)))


(defun replace-pairs--opening (opening)
  (or (gethash opening replace-pairs--openings-table)
      (error "Opening of %s not found" opening)))


(defun replace-pairs--choose-replacement (from-item _)
  (cond ((match-string 1) (replace-pairs--opening from-item))
        ((match-string 2) (replace-pairs--closing from-item))
        (t (error "No regex match data found, this should never happen"))))


;; Main function

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

  (let ((regexp (rx-to-string `(or (group ,(replace-pairs--opening from-item))
                                   (group ,(replace-pairs--closing from-item)))))
        (replacement (cons #'replace-pairs--choose-replacement to-item)))
    (perform-replace regexp replacement t t delimited nil nil start end backward)))



(provide 'replace-pairs)

;;; replace-pairs.el ends here
