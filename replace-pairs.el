;;; replace-pairs.el --- Find-replace pairs of things -*- lexical-binding: t; -*-

;; Copyright (C) 2015 Free Software Foundation, Inc.

;; Author: David Shepherd <davidshepherd7@gmail.com>
;; Version: 0.1
;; Package-Requires: ((dash "2.10.0") (names "20150618.0") (emacs "24.4"))
;; Keywords:
;; URL: https://github.com/davidshepherd7/replace-pairs

;;; Commentary:

;; TODO

;;; Code:

(require 'dash)
(require 'names)

;; namespacing using names.el:
;;;###autoload
(define-namespace replace-pairs-

;; Tell names that it's ok to expand things inside these threading macros.
:functionlike-macros (-->)

(defun replace-pairs ()
  (query-replace-regexp "(\\|)" "\\,")
  )


)

(provide 'replace-pairs)

;;; replace-pairs.el ends here

;; (defun xah-change-bracket-pairs (beg end φfromType φtoType)
;;   "Change bracket pairs from one type to another on current line or selection.

;; For example, change all parenthesis () to square brackets [].

;; When called in lisp program, beg end are region begin/end
;; position, φfromType or φtoType is a string of a bracket pair. ⁖
;; \"()\", \"[]\", etc. URL
;; `http://ergoemacs.org/emacs/elisp_change_brackets.html' Version
;; 2015-04-12"
;;   (interactive
;;    (let ((ξbracketsList
;;           '("()" "{}" "[]" "<>" "“”" "‘’" "‹›" "«»" "「」" "『』" "【】" "〖〗" "〈〉" "《》" "〔〕" "⦅⦆" "〚〛" "⦃⦄" "〈〉" "⦑⦒" "⧼⧽" "⟦⟧" "⟨⟩" "⟪⟫" "⟮⟯" "⟬⟭" "❛❜" "❝❞" "❨❩" "❪❫" "❴❵" "❬❭" "❮❯" "❰❱")))
;;      (if (use-region-p)
;;          (progn (list
;;                  (region-beginning)
;;                  (region-end)
;;                  (ido-completing-read "Replace this:" ξbracketsList )
;;                  (ido-completing-read "To:" ξbracketsList )))
;;        (progn
;;          (list
;;           (line-beginning-position)
;;           (line-end-position)
;;           (ido-completing-read "Replace this:" ξbracketsList )
;;           (ido-completing-read "To:" ξbracketsList ))))))
;;   (let* (
;;          (ξfindReplaceMap
;;           (vector
;;            (vector (char-to-string (elt φfromType 0)) (char-to-string (elt φtoType 0)))
;;            (vector (char-to-string (elt φfromType 1)) (char-to-string (elt φtoType 1))))))
;;     (save-excursion
;;       (save-restriction
;;         (narrow-to-region beg end)
;;         (let ( (case-fold-search nil))
;;           (mapc
;;            (lambda (ξx)
;;              (goto-char (point-min))
;;              (while (search-forward (elt ξx 0) nil t)
;;                (replace-match (elt ξx 1) 'FIXEDCASE 'LITERAL)))
;;            ξfindReplaceMap))))))
