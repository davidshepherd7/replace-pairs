(require 'f)

(defvar replace-pairs-support-path
  (f-dirname load-file-name))

(defvar replace-pairs-features-path
  (f-parent replace-pairs-support-path))

(defvar replace-pairs-root-path
  (f-parent replace-pairs-features-path))

(add-to-list 'load-path replace-pairs-root-path)

(require 'replace-pairs)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
